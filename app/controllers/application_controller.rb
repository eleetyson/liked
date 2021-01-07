class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  # finds the current user based on the value for the user_id key in the session hash
  # returns nil if user is not "logged in"
  def current_user
    User.find_by(id: session[:user_id])
  end

end
