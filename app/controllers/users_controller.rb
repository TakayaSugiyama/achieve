class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user, notice: "ユーザー登録が完了しました。"
    else  
      redirect_to signup_path, flash: {user: @user, error_messages: @user.errors.full_messages}
    end
  end

  def destroy
  end

  def update
  end

  private 

  def user_params 
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
