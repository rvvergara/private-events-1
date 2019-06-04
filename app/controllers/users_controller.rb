class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    flash[:success] = "Welcome !"
  end

  def show
    @user = User.find_by(id: params[:id])
    @events = @user.events
  end

  def index

  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
