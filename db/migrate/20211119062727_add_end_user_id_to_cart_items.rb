class AddEndUserIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :end_user_id, :integer
  end
end
