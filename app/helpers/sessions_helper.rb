module SessionsHelper
  def current_user 
    @user ||= User.find_by(id: session[:user_id])
  end

  def login?
    if current_user
      true
    end
  end
  
end
