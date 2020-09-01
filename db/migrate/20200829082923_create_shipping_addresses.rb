class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,           null: false
      t.string :phone_number,          null: false
      t.integer :prefecture_id,         null: false
      t.string :city,       default: "",null: false
      t.string :city_number,default: "",null: false
      t.string :building_name,     default: ""
      t.references :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end