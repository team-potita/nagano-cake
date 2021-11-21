# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_inactive_end_user, only: [:create]

def new
end

def create
end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def reject_inactive_user
    @user = User.find_by(name: params[:end_user][:name])
    if @user
      if @user.valid_password?(params[:end_user][:password]) && !@user.is_valid
        redirect_to new_user_session_path
      end
    end
  end

end
