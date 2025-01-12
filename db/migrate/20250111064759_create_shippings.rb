class CreateShippings < ActiveRecord::Migration[8.0]
  def change
    create_table :shippings do |t|
      t.references :order, null: false, foreign_key: true
      t.string :tracking_number
      t.string :carrier
      t.string :status
      t.date :estimated_delivery_date

      t.timestamps
    end
  end
end
