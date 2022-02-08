class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
      @posts = Post.all 

  end
    def show
       @post = Post.find(params[:id])
    end
      def new
      @post = Post.new
      end
      def edit
          @post = Post.find(params[:id])
      end
  def create
    @post = current_user.posts.new(post_params)
      respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }  
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      end
  end
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end    


    def search
     @search = params[:search]
      @posts =Post.where("posts.title Like ?",["%#{@search}%"])
      if @posts.present?
        redirect_to posts_path , notice: "search successfully"
      else 
        render :new
      end  
       
    end
  

  private
    def set_post
      @post = Post.find(params[:id])
    end

  
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end
