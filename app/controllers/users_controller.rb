class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	user_params = params.require(:user).permit(:username, :email, :password)
  	@funk = User.create(user_params)
  	redirect_to "/"
  end

  def show
  	render text: "I WILL BE AMAZED"
  end

end
