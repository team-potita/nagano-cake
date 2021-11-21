class Public::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end
<<<<<<< HEAD
=======
  
  def confirm
    @order = Order.new(end_user_params)
  end
>>>>>>> 81efb4a6492fc6f5d2d7152354c0a01a1e98be0c

end