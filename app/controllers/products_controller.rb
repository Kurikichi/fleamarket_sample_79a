class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
    @categories = Category.where(ancestry: nil).limit(13)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if params[:product][:images_attributes] && @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @produnt = Product.find(params[:id])
    @grandchild = Category.find(@product.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      @grandchild = Category.find(@product.category_id)
      @child = @grandchild.parent
      @parent = @child.parent
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  
  def show
    @product = Product.find(params[:id])
    
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :brand, :status, :shipping_charges, :shipping_origin, :days_until_shipping, :category_id, images_attributes:  [:src, :_destroy, :id]).merge(exhibition_status: 1, user_id: current_user.id)
  end
  
  def set_product
    @products = Product.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end