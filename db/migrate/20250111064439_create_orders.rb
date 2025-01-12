class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_status
      t.decimal :total_price
      t.string :payment_status
      t.integer :shipping_address_id
      t.integer :billing_address_id

      t.timestamps
    end
  end
end
