class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  # root route with Twitter sign on button
  def home
  end

  def show
    redirect_to user_path(current_user) if params[:id].to_i != current_user.id
  end

end
