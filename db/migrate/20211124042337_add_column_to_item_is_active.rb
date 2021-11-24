class AddColumnToItemIsActive < ActiveRecord::Migration[5.2]
  def change
    add_column :items,:is_active,:boolean,default: true
    add_column :items,:caption,:string
  end
end
