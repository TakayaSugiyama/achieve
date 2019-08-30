class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id  #ログインする
      redirect_to @user, notice: "ログインに成功しました。"
    else 
      flash.now[:notice] = "ログインに失敗しました。"
      render "sessions/new"
    end
  end

  def destroy
    user = User.find(params[:id])
    session.delte(:user_id)
    redirect_to root_url
  end

  def new;end
end
