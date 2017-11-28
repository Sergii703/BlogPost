class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 3)
  end
  
  def show

  end
  
  def new
    @post = Post.new
  end
  
  def edit
      
    end
  
  def update
          if @post.update_attributes(post_params)
            redirect_to @post, success: 'Articles has been updated correctly'
          else
            flash.now[:danger] = 'Article has not been updated correctly'
            render :edit
          end
      end
      
  def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, success: "The article successfully has been created"
      else
        flash.now[:danger] = 'The article has not been created'
        render :new 
      end    
  end
  
  def destroy
    
      @post.destroy
      redirect_to posts_path, success: 'The article has bee deleted'
  end
  
  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end
end







