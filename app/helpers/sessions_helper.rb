module SessionsHelper
  def current_user 
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login?
    if current_user
      true
    end
  end

end
