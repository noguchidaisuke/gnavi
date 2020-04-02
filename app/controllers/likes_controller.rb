class LikesController < ApplicationController

  def create
    @restaurant = Restaurant.find_or_initialize_by(id:params[:restaurant_g_id])
    current_user.like(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    current_user.unlike(@restaurant)
  end
end