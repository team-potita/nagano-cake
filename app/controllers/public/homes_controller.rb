class Public::HomesController < ApplicationController

  def top
    @items = Item.where(sale_status: "販売可")
  end

  def about
  end

end
