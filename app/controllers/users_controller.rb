class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find_by_nickname(params[:id])
  end
end
