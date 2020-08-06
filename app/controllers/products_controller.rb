class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
    @category = Category.where(ancestry: nil).limit(13)
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
    @product = Product.find(params[:id])
    @categories = Category.where(ancestry: nil).limit(13)

  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
  
  def show

    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user).order('created_at asc')
    

  end

  def search
    @products = Product.search(params[:keyword])
  end

  private

  def product_params
    params.require(:product).permit(:user_id, :name, :price, :explanation, :brand, :status, :shipping_charges, :shipping_origin, :days_until_shipping, :category_id,:seller_id,:buyer_id, images_attributes:  [:src, :_destroy, :id,:image]).merge(exhibition_status: 1, user_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end