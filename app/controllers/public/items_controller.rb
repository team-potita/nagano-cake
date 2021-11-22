class Public::ItemsController < ApplicationController

 def index
  	  @categories = Category.where(is_enabled: true)


    if params[:category_id]

      @category = Category.find(params[:category_id])

      @items = @category.items.order(created_at: :desc).where(sale_status: "販売可").page(params[:page]).per(8)


    else
      @items = Item.where(sale_status: "販売可").page(params[:page]).per(12)

    end
  end

  def show
    @cart_item = CartItem.new
  	@category = Category.all
  	@item = Item.find(params[:id])
  end

end
