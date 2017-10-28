class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    render :new     #sign up form
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:session_token] = user.session_token #log in
      redirect_to users_url
    else
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
