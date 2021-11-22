class Public::OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = @item.order
  end

  def show
    @item = Item.find(params[:item_id])
    @order = @item.order.new
  end

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    @order.save
    redirect_to items_path
  end


  def confirm
    @order = Order.new
    @cart_items = current_end_user.cart_items  
    @order.payment = params[:order][:payment]  
    if params[:order][:address_option] == "0"  
      @order.postal_code = current_end_user.postal_code  
      @order.order_address = current_end_user.address  
    elsif params[:order][:address_option] == "1"  
      @sta = params[:order][:order_address].to_i  
      binding.pry  
      @order_address = Address.find(@sta)  
      @order.postal_code = @order_address.postal_code  
      @order.order_address = @order_address.address  
      @order.dear_name = @order_address.dear_name  

    elsif params[:order][:address_option] == "2"  
      @order.postal_code = params[:order][:postal_code]  
      @order.order_address = params[:order][:order_address]  
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