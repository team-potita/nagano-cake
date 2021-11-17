class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|

      t.timestamps
      t.string :name#ジャンル名
      t.datetime :created_at#登録日時
      t.datetime :updated_at#更新日時
    end
  end
end
