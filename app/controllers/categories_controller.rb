class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
      @categories = Category.all
    end

  def show
    ##@posts = Post.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
       redirect_to categories_path, success: 'Category has been created successfully'
    else
       flash[:danger] = 'Category has not been created'
       render :new
    end
  end
  
  def edit   
  end
  
  def update
    if @category.update_attributes(category_params)
       redirect_to categories_path, success: 'Category has been created successfully'
    else
       flash[:danger] = 'Category has not been created'
       render :edit 
    end
  end
  
  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Category has been deleted successfully'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end