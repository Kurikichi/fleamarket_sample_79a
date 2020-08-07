class PurchasesController < ApplicationController
  require "payjp"
  before_action :set_product, only: [:buy, :pay]
  before_action :set_send

  def  done
    @product_purchaser= Product.find(params[:id])
    if @product_purchaser.update( purchased: current_user.id)
      redirect_to root_path
    else
      render action: :new
    end
  end
    
  def buy
    @images = @product.images.all

    if user_signed_in?
      @user = current_user
      if @user.credit_card.present?
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
   
        @card = CreditCard.find_by(user_id: current_user.id)
        charge = Payjp::Charge.create(
          amount: @product.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
          )

        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)

        @card_brand = @customer_card.brand
        case @card_brand
        when "Visa"
          @card_src = "Visa.svg"
        when "JCB"
          @card_src = "JCB.svg.png"
        when "MasterCard"
          @card_src = "Master.svg.png"
        when "American Express"
          @card_src = "amex.svg"
        when "Diners Club"
          @card_src = "Diners.png"
        when "Discover"
          @card_src = "discover.png"
        when "Saison"
          @card_src = "saison.svg.png"
        end
        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def pay
    @user = current_user
    @images = @product.images.all
      @product.with_lock do
        if current_user.credit_card.present?
          @card = CreditCard.find_by(user_id: current_user.id)
          Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
          charge = Payjp::Charge.create(
          amount: @product.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
          )
        else
          Payjp::Charge.create(
          amount: @product.price,
          card: params['payjp-token'], 
          currency: 'jpy'
          )
        end
        @purchases = Purchase.create(buyer_id: current_user.id, product_id: params[:product_id])
        @product.update(exhibition_status: 2)        
      end
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_send
    @send_id = DeliveryAddress.where(user_id: current_user.id).first
  end
end
