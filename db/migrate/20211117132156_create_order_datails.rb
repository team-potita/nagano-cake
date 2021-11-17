class CreateOrderDatails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_datails do |t|
      t.integer :item_id#商品id
      t.integer :order_id#注文id
      t.integer :price#税込価格
      t.string :quantity#数量
      t.datetime :created_at#登録日時
      t.datetime :updated_at#更新日時

      t.timestamps
    end
  end
end
