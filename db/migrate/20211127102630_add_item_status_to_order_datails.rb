class AddItemStatusToOrderDatails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_datails, :item_status, :string
  end
end
