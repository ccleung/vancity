class AdsController < ApplicationController

def new
end

def create
	#render plain: params[:ad].inspect
	#render plain: current_user.id
	@ad = Ad.new(ad_params)
	@ad.user_id = current_user.id
	@ad.save
	redirect_to @ad
end

def show
	@ad = Ad.find(params[:id])
end

private
	def ad_params
		params.require(:ad).permit(:title, :description, :ad_image)
	end
	before_action :authenticate_user!
end
