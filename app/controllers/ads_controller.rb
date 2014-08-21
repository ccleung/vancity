class AdsController < ApplicationController

def new
end

def create
	#render plain: params[:ad].inspect
	#render plain: current_user.id
	
	@ad = Ad.new
	@ad.title = ad_params[:title]
	@ad.description = ad_params[:description]

	@image = Image.new
	@image.image = ad_params[:image]
	@image.imageable = @ad
	@ad.user_id = current_user.id
	@ad.save
	@image.save
	redirect_to @ad
end

def show
	@ad = Ad.find(params[:id])
end

private
	def ad_params
		params.require(:ad).permit(:title, :description, :image)
	end
	before_action :authenticate_user!
end
