class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def unsubscribe
    @end_user = EndUser.find_by(name: params[:name])
  end

  def withdraw
    @end_user = EndUser.find_by(name: params[:name])
    @end_user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
  
end
