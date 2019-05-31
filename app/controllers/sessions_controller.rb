class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      session[:user_id] = user.id
    else
      flash[:danger] = "This Name don't exist !"
      render 'new'
    end
  end

  def destroy

  end
end
