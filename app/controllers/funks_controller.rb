class FunksController < ApplicationController

  def index
  	#
  	@funks = Funk.all
  end

  def new
  	@user = @current_user
  	@funk = Funk.new
    #byebug
  end

  def create
  	@user = @current_user
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
