class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @orders = Order.all
  end

  def show
    @cart_item = CartItem.find(params[:cart_items_id])
    @order = @cart_item.order.new
  end

  def new
    @order = Order.new
    @end_user = current_end_user
  end

  def create
    cart_items = current_end_user.cart_items.all
    @order = current_end_user.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = @order.id
        order_detail.quantity = cart.item.price
        order_detail.save
        cart_items.destory_all
        redirect_to order_complete_orders_path
      end
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
    @total_payment = 0
  end

  def complete
  end

private
  def order_params
    params.require(:order)
    .permit(:order,
            :address_option,
            :postcode,
            :order_address,
            :payment,
            :cart_item_id,
            :include_blank,
            :end_user_id,
            :name)
  end

end