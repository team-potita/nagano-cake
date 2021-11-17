class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :end_user_id#会員id
      t.string :postcode#郵便番号
      t.string :address#配送先の住所
      t.string :name#氏名
      t.integer :shipping_fee#配送料
      t.integer :total_price#合計金額
      t.integer :peyment_method#支払方法
      t.datetime :created_at#登録日
      t.datetime :updated_at#更新日

      t.timestamps
    end
  end
end
