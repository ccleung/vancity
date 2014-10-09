class PostsController < ApplicationController

def new
end

def create
	#render plain: params[:post].inspect
	#render plain: current_user.id
	
	@post = Post.new
	@post.title = post_params[:title]
	@post.description = post_params[:description]
	@post.user_id = current_user.id

	#if image exists we need to create a new image
	if post_params[:image]
		@image = Image.new
		@image.image = post_params[:image]
		@image.imageable = @post
		@image.save
	end

	#if location exists we need to create a new location
	if post_params[:location]
		#city, region, country
		locationInfo = post_params[:location].split(",")

		#@location = nil
		if (locationInfo.count == 3)
			conditions = { :city => locationInfo[0].strip, 
	               :region => locationInfo[1].strip,
	               :country => locationInfo[2].strip }
			@location = Location.find_or_create_by(conditions)
			@post.location_id = @location.id
		end
    end

    #TODO: don't create new caetgories, use existing static categories
    if post_params[:category]
    	@category = Category.find_or_create_by(:name => post_params[:category])
    	@post.category_id = @category.id
    end

    @post.save

	redirect_to @post
end

def show
	#render plain: params
	#params[:id] is now the slug
	@post = Post.find_by_slug(params[:id])
	#render plain: [request.path, post_path(@post)]

	#make sure we use the most recent url path even when the slug has changed
	if request.path != post_path(@post)
		render plain: 'hello world'
		redirect_to @post, status: :moved_permanently
	else
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @post }
		end
	end
end

private
	def post_params
		params.require(:post).permit(:title, :description, :image, :location, :category)
	end
	before_action :authenticate_user!
end
