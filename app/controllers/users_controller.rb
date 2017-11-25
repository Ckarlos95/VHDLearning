class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_from_nickname
  
  def show
    redirect_to user_path(current_user) unless @user&.nickname === current_user.nickname
  end

  protected

  def set_user_from_nickname
    @user = User.find_by_nickname(params[:id])
  end
end