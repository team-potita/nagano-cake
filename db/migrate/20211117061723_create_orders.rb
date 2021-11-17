class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :shipping_fee
      t.integer :total_price
      t.integer :peyment_method
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
