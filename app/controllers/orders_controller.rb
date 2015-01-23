class OrdersController < ApplicationController
	
	before_action :require_user	 
  before_action :find_product, except: :index

  def index
  	#List of all previous orders for the current_user
  end

  def show
  	#Show the order as a receipt
    @product = Product.find(params["id"])
    @order = Order.find(params["id"])
  end

  def new
  	@order = @product.orders.new
  end

  def create
    @order = @product.orders.new(order_params)
    @order.user = current.user
    if @order.save 

      	#Create a charge via Stripe.
        Stripe.api_key = "sk_test_lACF0Ogr7cGM8nLKwyWkC28i"
        Stripe::Charge.create(
        :amount => @order.product.price_in_pence,
        :currency => "gbp",
        :card => @order.stripe_token, # obtained with Stripe.js
        :description => "Charge for #{@order.product.name} purchased by #{@order.user.email}."
        )
      	#Save a record of the purchase

        flash[:success] = "Thanks for purchasing #{@product.name}, here's your receipt."
      	#Redirect to the receipt (show action)
        redirect_to user_order_path(@current_user, @product)
    else
        flash[:error] = "Oops, something went wrong, check your details and try again."
        render :new
    end
  end

  private
  def find_product
    @product = Product.find(params["product_id"])
    
  end

  def order_params
    params.require(:order).permit(:stripe_token, :delivery_address)
  end



end
