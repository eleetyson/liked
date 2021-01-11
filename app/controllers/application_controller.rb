class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :authorized?, :require_login, :require_logout, :client

  private

  # finds the current user based on the value for the user_id key in the session hash
  # returns nil if user is not "logged in"
  def current_user
    User.find_by(id: session[:user_id])
  end

  # returns true or false depending on whether the session hash has a user_id key / value
  def logged_in?
    !!session[:user_id]
  end

  # return true or false depending on whether user has access to requested resource
  def authorized?(id_str)
    id_str.to_i == current_user.id
  end

  # redirects to root if user isn't logged in
  def require_login
    redirect_to root_path unless logged_in?
  end

  # redirects to user's show page if user is logged in
  def require_logout
    redirect_to user_path(current_user) if logged_in?
  end

  # configures a client for simpler access to the Twitter API
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = session['token']
      config.access_token_secret = session['secret']
    end
  end

end
