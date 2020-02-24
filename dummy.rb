class RestaurantsController < ApplicationController
  include CommonActions
#目的はinterfaceを作ること。
#mergeしたい
=begin
query = {
  keyid: ENV['GURUNAVI_API_KEY'],
  hit_per_page: 30
}
query
=>freeword
=>latlong

#やりたいことはmergeすること。引数を投げたらそれに相当するfreeword,area,latlngを適当に回収してほしい。mergeしてほしい。

query.merge!(freeword)
class Query
  attr_reader :query
  def initialize(query)
    @query= query
  end
  def add(hoge)
    query
  end
end
class Freeword
  def foo
    query{}
  end
end
class Latlng
  def bar
  end
end

class Query.new(query)
=end
query
  def new
    restaurants = []
    @zoom = 16
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
    freeword = params[:freeword].presence
    @latitude, @longitude = params[:latlng].scan(/[0-9]+.[0-9]+/)
    query = {
      keyid: ENV['GURUNAVI_API_KEY'],
      hit_per_page: 30
    }
    area = params[:area].presence

    if params[:area] == "現在地"
      query.merge!(current_point)
    elsif params[:area].present?
      if freeword
        freeword += ',' + params[:area]
      else
        params[:area]
      end
    end

    if area == "現在地"
      query.merge!(current_point)
    elsif area.present?
      make_freeword
    end

    query.merge!({freeword: freeword})
    response = Faraday.get(url, query)
    response_json = JSON.parse(response.body)
    make_result(response_json)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @latlng = [@restaurant[:latitude], @restaurant[:longitude]]
    @comment = @restaurant.comments.new
    @comments = @restaurant.comments.with_attached_images.includes(:user).order(created_at: :DESC)
    @comment_images = @comments.select{ |comment| comment.images.attached? }
    @avg_comment_rating = @comments.average(:rating)&.round(1) || 0
  end

  private

  def current_point
    if @latitude.nil?
      flash[:danger] = "現在地を取得できませんでした。もう一度お願いします。"
      redirect_back(fallback_location: root_path)
    else
      current_point = { latitude: @latitude, longitude: @longitude }
      @zoom = 18
    end
  end

  def make_freeword(freeword, area)
    if freeword
      freeword += ',' + area
    else
      freeword = area
    end
  end

  def make_result
    if response_json.present?
      begin
        response_json['rest'].each do |rest|
          hash = make_hash(rest)
          restaurant = Restaurant.find_by(g_id: hash[:g_id]) || Restaurant.create(hash)  #なぜかf_or_c_by使えない、、、
          #restaurant=Restaurant.find_or_create_by(make_hash(rest))
          restaurant.shop_image1 = 'https://ximg.retty.me/crop/s172x172/-/retty_main/images/noimg_200_150.png' if restaurant.shop_image1.empty?
          restaurants << restaurant
        end
        restaurants = restaurants.to_ary
        @restaurants = Kaminari.paginate_array(restaurants).page(params[:page]).per(10)
        @centerlat = @restaurants.last.latitude
        @centerlong = @restaurants.last.longitude
      rescue => e
        puts e
        flash[:danger] = '該当のお店が見つかりませんでした。他のキーワードでお願いします'
        redirect_to root_path
      end
    end
  end

  def make_hash(rest)
    {
      g_id: rest['id'],
      name: rest['name'],
      url: rest['url'],
      shop_image1: rest['image_url']['shop_image1'],
      pc: rest['coupon_url']['pc'],
      pr_short: rest['pr']['pr_short'],
      latitude: rest['latitude'],
      longitude: rest['longitude'],
      tel: rest['tel'],
      pr_long: rest['pr']['pr_long'],
      category: rest['category'] ,
      station: rest['access']['station']
    }
  end
end