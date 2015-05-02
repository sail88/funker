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
  	redirect_to "/login"
  end

  def show # Show page about a given user -- from URL param
  	# @user = current_user USE THIS IF YOU WANT TO SHOW CURRENT USER
    # BUT THIS IS BAD FOR AUTHORIZATION PURPOSES
    whose_profile = params[:id].to_i
    #byebug
    @user = User.find(whose_profile)
    @current_user = current_user
    
    # NEED TO CHECK THAT CURRENT USER HAS ACCESS -- either is the same user or a follower
    if whose_profile == @current_user.id #|| are_you_following(whose_funks) ADD QUERY ABOUT WHETHER YOU ARE FOLLOWING THIS PERSON, ONCE WE HAVE THAT INFO
      @user = User.find(whose_profile)
    else
      redirect_to "/users/#{@current_user.id}" #Go to your own page
    end 


    #byebug
  

  end

end
