class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  # root route with Twitter sign on button
  def home
  end

  # fetches authenticating user's Twitter follows, randomly selects one, and instantiates a Follow object with that account info
  # fetches recent likes from account represented by the Follow object, randomly picks one, and instantiates a Like object with that tweet info
  #
  def show
    redirect_to user_path(current_user) if !authorized?(params[:id])

    follow = current_user.get_random_follow(client)
    @follow = Follow.create(uid: follow.attrs[:id_str], name: follow.attrs[:name], handle: follow.attrs[:screen_name], user_id: current_user.id)

    like = @follow.get_random_like(client)
    @like = Like.create(tid: like.attrs[:id_str], follow_id: @follow.id)
  end

end
