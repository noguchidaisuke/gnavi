class SessionsController < ApplicationController
  def twitter_create
    @user = User.find_or_initialize_from_auth(request.env['omniauth.auth'])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ログインに成功しました"
      redirect_to @user
    else
      flasn.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def create
    email    = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success]     = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger]  = invalid_reason(@user,password)
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end

  def invalid_reason(user,password)
    if user.nil? && password.empty?
      "EmailとPasswordが間違っています"
    elsif user.nil?
      "Emailが間違っています"
    else
      "Passwordのみ間違っています"
    end
  end
end
