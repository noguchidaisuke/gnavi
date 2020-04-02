class RelationshipsController < ApplicationController
  before_action :require_user_logged_in, :set_user

  def create
    relationship = current_user.follow(@user)
    if relationship.save
      flash[:success] = 'フォローしました！'
      render'create'
    else
      flash[:danger] = 'フォロー失敗しました'
      recent_page
    end
  end

  def destroy
    if current_user.unfollow(@user)
      flash[:success] = 'フォローを外しました！'
      render 'destroy'
    else
      flash[:danger] = 'フォロー失敗しました'
      recent_page
    end
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end

  def recent_page
    redirect_back(fallback_location: root_path)
  end
  
end
