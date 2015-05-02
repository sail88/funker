class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	user_params = params.require(:user).permit(:username, :email, :password)
  	#byebug
  	@funk = User.create(user_params)
  	redirect_to "/login"
  end

  def show
  	@user = current_user
  	#byebug
  	#@user = User.find(params[:id])
  

  end

end
