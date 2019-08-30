class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      redirect_to @user, notice: "ログインに成功しました。"
    else 
      flash.now[:notice] = "ログインに失敗しました。"
      render "sessions/new"
    end
  end

  def destroy;end

  def new;end
end
