class SessionsController < ApplicationController

# GET /auth/twitter/callback
# logs user on
# finds existing account or creates a new one
# stores user id in session hash for reference
  def create
    # user = User.find_or_create_by(uid: auth['uid']) do |u|
    #   u.name = auth[:info][:name]
    #   u.handle = auth[:info][:nickname]
    #   u.token = auth[:credentials][:token]
    #   u.secret = auth[:credentials][:secret]
    # end
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

# POST /logout
# logs the user out and redirects them to the root page
  def destroy
    session.clear
    redirect_to root_path
  end

  private

  # helper method to make parsing omniauth response simpler
  def auth
    request.env['omniauth.auth']
  end

end
