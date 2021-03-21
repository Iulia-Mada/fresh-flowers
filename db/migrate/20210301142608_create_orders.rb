class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :status
      t.string :email

      t.timestamps
    end
  end
end
