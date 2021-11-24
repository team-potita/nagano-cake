class Public::HomesController < ApplicationController

  def top
    @items = Item.all
    @category = Category.all
  end

  def about
  end

end
