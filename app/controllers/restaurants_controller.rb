class RestaurantsController < ApplicationController
  def new
    @restaurants,@latitude,@longitude = [],[],[]
    url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/'
    freeword = params[:freeword]
    query = {
      keyid: ENV['GURUNAVI_API_KEY']
    }

    if self.params[:area] ==""
      freeword = nil
    elsif params[:area] == "現在地"
      latlng=params[:latlng]
      latitude,longitude=latlng.scan(/[0-9]+.[0-9]+/)
      current_point={latitude: latitude,
        longitude: longitude,
        range: 3
      }
      query.merge!(current_point)
    else
      freeword+= ',' + params[:area]
      query[:freeword]=freeword
    end
    query.merge!({freeword: freeword})
    binding.pry
    response = Faraday.get(url,query)
    response_json = JSON.parse(response.body)
    if response_json.present?
      begin
        response_json['rest'].each do |rest|
          restaurant = Restaurant.new(read(rest))
          if Restaurant.find_by(g_id: restaurant[:g_id])
            restaurant = Restaurant.find_by(g_id: restaurant[:g_id])
          else
            restaurant.save
          end
          @restaurants << restaurant
          @centerlat = @restaurants.first.latitude
          @centerlong = @restaurants.first.longitude
        end
      rescue
        flash[:danger]='該当のお店が見つかりませんでした。他のキーワードでお願いします'
        redirect_to root_path
      end
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @comments =@restaurant.comments
    @latlng = [@restaurant[:latitude],@restaurant[:longitude]]
    @comment = @restaurant.comments.new
  end
end