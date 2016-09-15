class UsersController < ApplicationController
  before_action :is_signed_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @alert = params[:alert]
  end


  private

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
  end

  def is_signed_in?
    @user = User.find(params[:id])
    unless @user.id == session[:user_id]
      redirect_to '/'
    end
  end
end
