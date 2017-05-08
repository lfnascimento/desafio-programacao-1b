class Purchase < ActiveRecord::Base
  belongs_to :purchase_order

  validates :buyer_name, :item_description, :unit_cost, :count, 
    :supplier_name, :supplier_address, :purchase_order, presence: true
end
