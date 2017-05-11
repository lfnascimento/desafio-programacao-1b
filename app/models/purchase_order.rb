class PurchaseOrder < ActiveRecord::Base
  has_many :purchases, dependent: :destroy
  validates :purchases, presence: true
  validates_associated :purchases
  include Parsable
  
  scope :eager, -> { includes(:purchases) }

  def uploaded_txt_file=(incoming_file)
    return if uploaded_io.content_type != 'text/plain'
    normalized_purchase_data = parser_txt(incoming_file, txt_header_attributes)
    purchases.build(normalized_purchase_data)
  end

  def gross_revenue
    purchases.inject(0) { |sum, p| sum + (p.unit_cost * p.count) }
  end

  private

  def txt_header_attributes
    exception_attributes = ["id", "purchase_order_id"]
    (Purchase.attribute_names - exception_attributes).map(&:to_sym)
  end

end
