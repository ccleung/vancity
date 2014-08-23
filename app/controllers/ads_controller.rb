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
	#render plain: params
	#params[:id] is now the slug
	@ad = Ad.find_by_slug(params[:id])
	#render plain: [request.path, ad_path(@ad)]

	#make sure we use the most recent url path even when the slug has changed
	if request.path != ad_path(@ad)
		render plain: 'hello world'
		redirect_to @ad, status: :moved_permanently
	else
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @ad }
		end
	end
end

private
	def ad_params
		params.require(:ad).permit(:title, :description, :image)
	end
	before_action :authenticate_user!
end
