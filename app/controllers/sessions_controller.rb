class SessionsController < ApplicationController

# GET /auth/twitter/callback
# logs user in given valid credentials
# redirects to sign on page if not
  def create
    binding.pry
    # @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #   u.name = auth['info']['name']
    #   u.email = auth['info']['email']
    #   u.password = SecureRandom.hex(10)
    # end
    #
    # session[:user_id] = @user.id
    # redirect_to user_path(@user)
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
