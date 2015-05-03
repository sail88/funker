class SessionsController < ApplicationController
  def start
  end

  def find
    #latitude = params[:lat].to_f
    #longitude = params[:long].to_f
    session[:lat] = params[:lat].to_f
    session[:long] = params[:long].to_f
    redirect_to users_path
  end

  def new
  end

  def create
    user_params = params.require(:user)
    user = User.confirm(user_params[:email], user_params[:password])
    if user
      login(user)
      redirect_to user_path(user.id)
    else
     # Flash an error message
      flash[:error] = "Failed To Authenticate. Please try again."
      redirect_to "/login"
    end
  end

  def destroy
    logout
    redirect_to '/login'
  end

end
