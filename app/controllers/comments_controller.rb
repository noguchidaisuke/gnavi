class CommentsController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_restaurant, except: :remove_image
    before_action :set_comment,only: %w(edit update destroy remove_image)
    before_action :authorize_comment, only: %w(edit update destroy remove_image)
    before_action :all_comments, only: %w(update destroy)

    def new
        @comment = @restaurant.comments.build
        @comment_images = Comment.all.order('created_at DESC').limit(5).with_attached_images
    end

    def create
        @comment = @restaurant.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment_images = Comment.limit(5).with_attached_images

        respond_to do |format|
            if @comment.save
                format.html {
                    flash[:success] = "コメントを投稿しました！"
                    redirect_to @restaurant
                }
                format.js { all_comments }
            else
                render :new
            end
        end
    end

    def destroy
        @comment.destroy
    end

    def edit; end

    def update
        render :edit unless @comment.update(comment_params)
    end

    def remove_image
        image = ActiveStorage::Attachment.find(params[:remove_id])
        image.purge
        recent_page
    end

private

    def comment_params
        params.require(:comment).permit(:restaurant_id, :user_id, :comment, :rating, images:[])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_comment
        @comment = Comment.find(params[:id] || params[:comment_id])
    end

    def recent_page
        redirect_back(fallback_location: root_path)
    end

    def all_comments
        @comments = @restaurant.comments.order(created_at: :desc)
        @avg_comment_rating = @comments.average(:rating)&.round(1) || 3
    end

    def authorize_comment
        authorize(@comment)
    end
end
