class PostsController < ApplicationController
  before_action :load_categories, only: [:show, :edit, :update, :new, :index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @category_id = params[:category_id]
  end

  def create
    #render plain: params[:post].inspect
    #render plain: current_user.id

    @post = Post.new
    @post.title = post_params[:title]
    @post.description = post_params[:description]
    @post.user_id = current_user.id

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

    @post.category_id = post_params[:category]

    respond_to do |format|
      if @post.save
        #if image exists we need to create a new image
        if post_params[:image]
          @image = Image.new
          @image.image = post_params[:image]
          @image.imageable = @post
          @image.save
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
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
    end
  end

  def reply
    @original_post = Post.find_by_slug(params[:id])
  end

  def email_reply
    @original_post = Post.find_by_slug(params[:id])
    #render plain: params[:reply]
    # send email to original poster
    replier = current_user
    reply_message = params[:reply]
    original_poster = User.find_by_id(@original_post.user_id)
    UserMailer.reply_post_email(replier.email, original_poster.email, reply_message[:title], reply_message[:description]).deliver
    render 'reply_sent'
  end

  private
  def load_categories
    @categories = Category.all
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :location, :category)
  end
  before_action :authenticate_user!, except: [:show]
end
