class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @orders = Order.all

  end

  def new
    @order = Order.new
    @end_user = current_end_user
  end

  def create
    cart_items = current_end_user.cart_items.all
    @order = current_end_user.orders.new(order_params)
    @order.status = 0
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDatail.new
        order_detail.item_id = cart.item_id
        order_detail.quantity = cart.item.price
        order_detail.order_id = @order.id
        order_detail.save
        cart_items.destroy_all
      end
      redirect_to complete_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new
    @cart_items = current_end_user.cart_items
    @order.peyment_method = (params[:order][:payment]).to_i
    if params[:order][:address_option] == "0"
      @order.name = current_end_user.last_name
      @order.postcode = current_end_user.postcode
      @order.address = current_end_user.address
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
    @total_price = calculate(current_end_user)
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
  end


  def calculate(user)
  total_price = 0
  user.cart_items.each do |cart_item|
  total_price += cart_item.quantity * cart_item.item.price
   end
   return (total_price * 1.1).floor
  end

private
  def order_params
    params.require(:order)
    .permit(:address,
            :postcode,
            :end_user_id,
            :name,
            :total_price,
            :peyment_method,
            :shipping_fee,
            :status)
  end

end