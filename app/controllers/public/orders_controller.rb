class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @orders = Order.all
  end

  def show
    @cart_items = CartItem.find(params[:cart_items_id])
    @order = @cart_items.order.new
  end

  def new
    @order = Order.new
    @end_user = current_end_user
  end

  def create
    #@cart_items = CartItem.find(params[:item_id])
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.save
     redirect_to order_confirm_orders_path

  end

  def confirm
    @order = Order.new
    @cart_items = current_end_user.cart_items
    @order.payment = params[:order][:payment]
    if params[:order][:address_option] == "0"
      @order.postcode = current_end_user.postcode
      @order.order_address = current_end_user.address
    elsif params[:order][:address_option] == "1"
      @sta = params[:order][:order_address].to_i
      binding.pry
      @order_address = Address.find(@sta)
      @order.postcode = @order_address.postcode
      @order.order_address = @order_address.address
      @order.dear_name = @order_address.dear_name
    elsif params[:order][:address_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.order_address = params[:order][:order_address]
    redirect_to complete_orders_path
    end
  end

private
  def order_params
    params.require(:order)
    .permit(:amount,
            :quantity,
            :item_id)
  end

end