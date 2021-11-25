class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!

 def index
   @cart_items = current_end_user.cart_items
   @total_price = calculate(current_end_user)
 end

 def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.end_user_id = current_end_user.id
   @cart_items = current_end_user.cart_items
   @cart_items.each do |cart_item|
       if cart_item.item_id == @cart_item.item_id
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update(quantity: new_quantity)
          @cart_item.delete
       end
   end
   @cart_item.save
   redirect_to cart_items_path

 end

 def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
 end

 def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_items_path
 end

 def destroy_all
   current_end_user.cart_items.destroy_all
   redirect_to cart_items_path
 end

 private
 def cart_item_params
   params.require(:cart_item).permit(:end_user_id, :item_id, :quantity)
 end

 def calculate(user)
   total_price = 0
   user.cart_items.each do |cart_item|
     total_price += cart_item.quantity * cart_item.item.price
   end
   return (total_price * 1.1).floor
 end
end