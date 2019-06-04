class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !current_user.nil?
  end

helper_method :logged_in?

  def current_user?(user)
    user == current_user
  end


  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
        @current_user = user
    end
  end

  helper_method :current_user

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
