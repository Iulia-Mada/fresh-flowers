class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false, unique: true, limit: 100
      t.string :description, null: false
      t.string :color_name, null: false
      t.string :zodiac_sign, null: false
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps

      t.index :name
      t.index :color_name
      t.index :zodiac_sign
    end
  end
end
