class AddColumnsToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users,:last_name,:string
    add_column :end_users,:first_name,:string
    add_column :end_users,:last_name_kana,:string
    add_column :end_users,:first_name_kana,:string
    add_column :end_users,:postcode,:string
    add_column :end_users,:tel,:string
    add_column :end_users,:address,:string
    add_column :end_users,:is_valid,:boolean
  end
end
