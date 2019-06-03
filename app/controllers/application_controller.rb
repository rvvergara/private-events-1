class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
        @current_user = user
    end
  end
end
