class FunksController < ApplicationController

  def index
    logged_in?
    # show all the Funks of the user whose id is in the URL
    whose_funks = params[:user_id].to_i
    @user = current_user
    
    # NEED TO CHECK THAT CURRENT USER HAS ACCESS -- either is the same user or a follower
    if whose_funks == @user.id #|| are_you_following(whose_funks) ADD QUERY ABOUT WHETHER YOU ARE FOLLOWING THIS PERSON, ONCE WE HAVE THAT INFO
      @funks = Funk.where({user_id: session[:user_id]})
    else
      redirect_to "/users/#{whose_funks}" #Go to your own page
    end 
  end

  def new
    logged_in?
  	@user = current_user
  	@funk = Funk.new
    #byebug
  end

  def create
    logged_in?
  	@user = current_user
  	funk_params = params.require(:funk).permit(:content)
    #byebug
  	#new_content = funk_params[:content]
  	@funk = @user.funks.create(funk_params) #this is one step way of ASSOCIATING and CREATING a new funk

  	redirect_to "/"
  end

  def show
  	#
  end

  def destroy
  	#
  end

end
