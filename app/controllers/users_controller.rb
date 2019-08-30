class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  def new
    @user = User.new(flash[:user])
  end

  def show
    
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id    #ログインする
      redirect_to @user, notice: "ユーザー登録が完了しました。"
    else  
      redirect_to signup_path, flash: {user: @user, error_messages: @user.errors.full_messages}
    end
  end

  def destroy
  end

  def update
    if @user.update(user_params)
      redirect_to @user,notice: "ユーザー情報の編集が完了しました。"
    else
      redirect_to edit_user_path, flash: {user: @user, error_messages: @user.errors.full_messages}
    end
  end

  def edit 

  end

  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
