class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :buyer_name
      t.string :item_description
      t.decimal :unit_cost, precision: 14, scale: 2
      t.integer :count
      t.string :supplier_address
      t.string :supplier_name
      t.references :purchase_order
      
      t.timestamps null: true
    end
  end
end
