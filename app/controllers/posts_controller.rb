class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_post_like, only: [:like, :view_post]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @post = Post.new 
    @photos = @post.photos.new
    @comment= Comment.new
    @profile= Profile.where(user_id: current_user.id).first
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @photos = @post.photos.all
  end
  def view_post
    @comment = Comment.new
    @profile = Profile.where(user_id: current_user.id).first
  end  
  
  def like
    @post.counter= @post.counter+1
     respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js
        
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    
      
  end  
  # GET /posts/new
  def new
    @post = Post.new
    @photos = @post.photos.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.profile_id = Profile.where(user_id: current_user.id).first.id
      
    respond_to do |format|
      if @post.save
          params[:photos]['url'].each do |a|
            @photos = Photo.create!(url: a, post_id: @post.id)
          end
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_post_like
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :photo, :importance, :state, :counter,
        photos_attributes: [:id, :post_id, :url, :url_cache])
    end
end
