class Public::AddressController < ApplicationController
  def index
    @address_new = Address.new
    @addresses = current_end_user.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save!
       redirect_to address_index_path
    else
       @address_new = Address.new
       @addresses = current_end_user.addresses
       render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to address_index_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to address_index_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :postcode, :addresses)
  end
end