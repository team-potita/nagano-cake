class Admin::CategorysController < ApplicationController

def index
    @categorys = Categorys.new
    @categorys = Categorys.all
end

  def create
    @categorys = Categorys.new(categorys_params)
    if @categorys.save
      redirect_to admin_categorys_path
      flash[:notice] = "ジャンルを新規追加しました。"
    else
      @categorys = Categorys.all
      render :index
    end
  end

  def edit
    @categorys = Categorys.find(params[:id])
  end

  def update
    @categorys = Categorys.find(params[:id])
    if @categorys.update(categorys_params)
      redirect_to admin_genres_path
      flash[:notice] = "ジャンル情報を更新しました。"
    else
      render :edit
    end
  end

  private
  def categorys_params
    params.require(:categorys).permit(:name)
  end


end
