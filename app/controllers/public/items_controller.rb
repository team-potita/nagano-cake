class Public::ItemsController < ApplicationController

 def index
  	  @categorys = Category.all


    if params[:category_id]

      @category = Category.find(params[:category_id])

      @items = @category.items


    else
      @items = Item.all

    end
  end

  def show
    @cart_item = CartItem.new
  	@category = Category.all
  	@item = Item.find(params[:id])
  end
 end

