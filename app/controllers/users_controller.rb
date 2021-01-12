class UsersController < ApplicationController
  before_action :require_logout, only: [:home]
  before_action :require_login, only: [:show]

  # root route with Twitter sign on button
  def home
  end

  # uses a helper method to randomly select and instantiate one of user's Twitter follows as an object
  # fetches recent likes from account represented by the Follow object and randomly picks one
  # uses that tweet's information to create a corresponding Like object and generate logic for embedding it in the view
  def show
    redirect_to user_path(current_user) if !authorized?(params[:id])

    follow = get_random_follow
    @follow = Follow.create(uid: follow.attrs[:id_str], name: follow.attrs[:name], handle: follow.attrs[:screen_name], user_id: current_user.id)

    like = @follow.get_random_like(client)
    @like = Like.create(tid: like.attrs[:id_str], follow_id: @follow.id)
    @embedded_tweet = client.oembed(@like.get_tid_int)
  end

end
