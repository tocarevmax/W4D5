class SessionsController < ApplicationController

  def new
    #log in form
    render :new
  end

  def create
    #pass session token
    user = User.find_by_credentials(params[:users][:email], params[:users][:password])
    if user
      login(user)
      redirect_to users_url
    else
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to bands_url
    # redirect_to :new_session
  end
end
