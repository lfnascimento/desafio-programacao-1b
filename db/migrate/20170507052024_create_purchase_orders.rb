class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|

      t.timestamps null: false
    end
  end
end
