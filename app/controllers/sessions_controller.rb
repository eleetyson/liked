class SessionsController < ApplicationController

# GET /auth/twitter/callback
# logs user on
# finds existing account or creates a new one
# stores user id in session hash for reference
  def create
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
