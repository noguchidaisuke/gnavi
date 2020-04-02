module UserActions
  extend ActiveSupport::Concern

  included do
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  private

  def ajax_redirect_to(redirect_uri)
    { js: "window.location.replace('#{redirect_uri}');" }
  end

  def require_user_logged_in
    unless logged_in?
      respond_to do |format|
        format.html {redirect_to login_path,notice: "ログインしてください"}
        format.js {
          flash[:notice] = "ログインしてください"
          render ajax_redirect_to(login_path)
        }
      end
    end
  end
end