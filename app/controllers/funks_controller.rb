class FunksController < ApplicationController

  def index
  	#
  	@funks = Funk.all
  end

  def new
  	#
  	@funk = Funk.new
  end

  def create
  	
  	funk_params = params.require(:funk).permit(:content)
  	new_content = funk_params[:content]
  	@funk = Funk.create(funk_params)

  	redirect_to "/"

  end

  def show
  	#
  end

  def destroy
  	#
  end

end
