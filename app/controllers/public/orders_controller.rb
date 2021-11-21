class Public::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end
  
  def confirm
    @order = Order.new(end_user_params)
  end

end