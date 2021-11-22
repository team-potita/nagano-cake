class HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  def top
    @category = Category.new
    @items = Item.all
  end

  def about
  end
end
