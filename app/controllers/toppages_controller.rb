class ToppagesController < ApplicationController
  def index
    comments = Comment.includes([:restaurant]).find_by_sql("SELECT * FROM comments WHERE(id, restaurant_id, rating) IN ( SELECT max(id), restaurant_id, avg(rating) FROM comments group by restaurant_id) ORDER BY rating DESC")
    @restaurants = comments.map(&:restaurant)
    @comments = Comment.includes([:restaurant, :user]).with_attached_images.order(created_at: :DESC).limit(8)
  end
end