class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    # Rails magic!  Go look in our database for a user with that provider and uid. If they don't exist yet, create them.
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    # Go set the session user_id
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in successfully!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out successfully!"
  end
end
