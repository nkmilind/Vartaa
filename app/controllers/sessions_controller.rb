class SessionsController < ApplicationController
	skip_before_action :auth
  layout false

  def create
    # params["email"] => the email address
    # params["password"] => the password
    
    @user = User.find_by(email: params["email"])
    if @user.present?
      # Yes, the user exists
      if @user.authenticate(params["password"])
        session["user_id"] = @user.id
        redirect_to root_url
      else
        redirect_to new_sessions_url, alert: 'No way!!!'
      end
    else
      # No user with that email
      redirect_to new_sessions_url, alert: 'No way!!!'
    end

    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_url, notice: "See ya later!"
  end
end