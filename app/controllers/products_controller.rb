class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show]
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
    @produnt = Product.find(params[:id])
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
    @produnt = Product.find(params[:id])
  end
  

  private

  def product_params
    params.require(:product).permit(:name, :price, :explanation, :brand, :status, :shipping_charges, :shipping_origin, :days_until_shipping, :category_id, images_attributes:  [:src, :_destroy, :id]).merge(exhibition_status: 1, user_id: current_user.id)
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