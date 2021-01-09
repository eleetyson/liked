class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  # root route with Twitter sign on button
  def home
  end

  # passes a client object from application#client as an argument to a user instance method
  # the user instance method fetches user's Twitter follows, randomly selects one, and returns the account info as an object
  def show
    redirect_to user_path(current_user) if !authorized?(params[:id])
    binding.pry
    # follow = current_user.get_random_follow(client)
    # Follow.create(uid: follow.attrs[:id_str], name: follow.attrs[:name], handle: follow.attrs[:screen_name], user_id: current_user.id)
  end

end
