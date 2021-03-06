class CommentsController < ApplicationController
  before_action :set_product, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  
  def create
    @comment = @product.comments.create(comment_params)
    if @comment.save
        @comment = Comment.new
        get_all_comments
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
        get_all_comments
    else 
      flash.now[:alert] = "failed to update"
      render action: :edit        
    end
  end

  def destroy
    if @comment.destroy
        get_all_comments
    else
      flash.now[:alert] = "failed to delete"
      redirect_to :product_path
    end
  end
      
  private
  
  def set_product
      @product = Product.find(params[:product_id])
  end
  
  def set_comment
      @comment = Comment.find(params[:id])
  end
  
  def get_all_comments
      @comments = @product.comments.includes(:user).order('created_at asc')
  end
  
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end

