class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:user_id] = @user.id
      current_user
      redirect_to @user
    else
      flash[:danger] = "This Name don't exist !"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
