class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id #ジャンルid
      t.string :name #商品名
      t.string :image_id #商品画像
      t.string :item #商品説明
      t.integer :price #税抜き商品
      t.datetime :create_at #登録日時
      t.datetime :updated_at #更新日時
      


      t.timestamps
    end
  end
end
