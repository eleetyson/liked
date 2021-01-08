class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  # root route with Twitter sign on button
  def home
  end

  # main page
  def show
    redirect_to user_path(current_user) if !authorized?(params[:id])
  end

end
