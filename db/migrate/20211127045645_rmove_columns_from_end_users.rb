class RmoveColumnsFromEndUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :end_users, :postal_code, :string
    rename_column :end_users, :prefecture_code, :string
    rename_column :end_users, :city, :string
    rename_column :end_users, :street, :string
    rename_column :end_users, :other_address, :string

  end
end
