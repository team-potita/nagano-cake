class Public::EndUsersController < ApplicationController

  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  def withdraw
    @user = User.find_by(name: params[:name])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
  
end
