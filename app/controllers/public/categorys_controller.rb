class Public::CategorysController < ApplicationController

  def index
    @categorys = Category.all
    @category = Category.find(params[:id])
  end

end
