class SessionsController < ApplicationController

# GET /auth/twitter/callback
# logs user on by finding existing account or creating a new one
# stores user information in session hash for reference
# redirects to users#show
  def create
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    session[:token] = user.token
    session[:secret] = user.secret
    redirect_to user_path(user)
  end

# POST /logout
# logs the user out and redirects them to the root page
  def destroy
    session.clear
    redirect_to root_path
  end

  private

  # helper method to simplify parsing omniauth response
  def auth
    request.env['omniauth.auth']
  end

end
