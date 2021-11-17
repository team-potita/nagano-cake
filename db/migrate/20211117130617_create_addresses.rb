class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :postcode
      t.string :addresses
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at


      t.timestamps
    end
  end
end
