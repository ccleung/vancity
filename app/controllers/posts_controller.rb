class PostsController < ApplicationController

def new
end

def create
	#render plain: params[:post].inspect
	#render plain: current_user.id
	
	@post = Post.new
	@post.title = post_params[:title]
	@post.description = post_params[:description]

	@image = Image.new
	@image.image = post_params[:image]
	@image.imageable = @post
	@post.user_id = current_user.id
	@post.save
	@image.save
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
		params.require(:post).permit(:title, :description, :image)
	end
	before_action :authenticate_user!
end
