class AdsController < ApplicationController

def new
end

def create
	#render plain: params[:ad].inspect
	@ad = Ad.new(ad_params)
	@ad.save
	redirect_to @ad
end

def show
	@ad = Ad.find(params[:id])
end

private
	def ad_params
		params.require(:ad).permit(:title, :description)
	end

end
