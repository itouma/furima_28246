class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false, default: ""
      t.integer :price,             null: false
      t.string :text,               null: false, default: ""

      t.text :image,                null: false

      t.integer :category_id,       null: false
      t.integer :item_status_id,    null: false
      t.integer :cost_burden_id,    null: false
      t.integer :shipping_place_id, null: false
      t.integer :ship_date_id,      null: false
      t.integer :user_id,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
