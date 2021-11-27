class Admin::EndUsersController < ApplicationController
   before_action :authenticate_admin!

    def index
        @end_users = EndUser.all.page(params[:page])
    end

    def show
       @end_user = EndUser.find(params[:id])
    end

    def edit
       @end_user = EndUser.find(params[:id])
    end

    def update
       @end_user = EndUser.find(params[:id])
     if
       @end_user.update(end_users_params)
       flash[:success] = "登録情報を更新しました"
       redirect_to "/admin/end_users/#{@end_user.id}"
     else
       render :edit
     end
    end


    private
    def customer_params
    params.require(:end_users).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_cord, :address, :phone_number, :is_deleted, :email)
    end
end

# def full_name
  # self.last_name + " " + self.first_name
# end

# def full_name_kana
#   self.last_name + " " + self.first_name
# end