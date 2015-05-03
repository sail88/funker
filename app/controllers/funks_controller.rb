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
    funk_params[:latitude] = session[:lat]
    funk_params[:longitude] = session[:long]
    byebug
  	#new_content = funk_params[:content]
  	@funk = @user.funks.create(funk_params) #this is one step way of ASSOCIATING and CREATING a new funk

  	redirect_to "/"
  end

  def show
  	@current_user = current_user
    who_is_asking = params[:user_id].to_i
    funk_id = params[:id].to_i
    who_is_funk_owner = Funk.find(funk_id).user_id

    if (@current_user.id == who_is_asking) and (@current_user.id == who_is_funk_owner)  #|| are_you_following(whose_funk)
      @funk = Funk.find(funk_id)
    else
      redirect_to "/users/#{who_is_asking}/funks"
    end
  end

  def edit
    @current_user = current_user
    @user = @current_user
    who_is_asking = params[:user_id].to_i
    funk_id = params[:id].to_i
    who_is_funk_owner = Funk.find(funk_id).user_id

    if (@current_user.id == who_is_asking) and (@current_user.id == who_is_funk_owner)  #ONLY FUNK OWNER CAN EDIT
      @funk = Funk.find(funk_id)
    else
      redirect_to "/users/#{who_is_asking}/funks"
    end
  end

  def update
    funk_params = params.require(:funk).permit(:content)
    #@funk.update(funk_params)
    #this should have worked per
    # https://github.com/sf-wdi-17/notes/blob/master/lectures/week-07/_3_wednesday/dawn/prepped/authors_books_app/app/controllers/books_controller.rb
    redirect_to [@user]
  end

  def destroy
  	#
  end

end
