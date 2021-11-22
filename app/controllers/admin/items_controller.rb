class Admin::ItemsController < ApplicationController

  def index
    @items = Items.all.page(params[:page]).per(10)
  end

  def show
    @items = Items.find(params[:id])
  end

  def new
    @items = Items.new
  end

  def create
    @items = Items.new(items_params)
    if @product.save
      redirect_to admin_items_path(@items.id)
      flash[:notice] = "商品を新規追加しました。"
    else
      render :new
    end
  end

  def edit
    @items = items.find(params[:id])
  end

  def update
    @items = Items.find(params[:id])
    if @items.update(product_params)
      redirect_to admin_product_path(@items)
      flash[:notice] = "商品情報を更新しました。"
    else
      render :edit
    end
  end


  private

  def items_params
    params.require(:items).permit(:name, :price, :caption, :image, :is_active, :categorys_id)
  end

end
