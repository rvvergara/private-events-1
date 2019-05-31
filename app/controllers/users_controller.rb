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
    @events = User.find_by(id: params[:id]).events
  end

  def index

  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
