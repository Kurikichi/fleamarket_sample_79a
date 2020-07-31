class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
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
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  
  def show
    @seller = @product.seller.name
    # @grandchild = Category.find(@product.category_id)
    # @child = @grandchild.parent
    # @parent = @child.parent
    # @products = Product.find(params[:id])
    # @comment = Comment.new
    # @comments = @products.comments.includes(:user).order(created_at: :desc)
  end
  

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :brand, :status, :shipping_charges, :shipping_origin, :days_until_shipping, :category_id, images_attributes:  [:src, :_destroy, :id]).merge(exhibition_status: 1)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

end