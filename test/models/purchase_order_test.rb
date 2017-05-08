require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  def setup
    @purchase_order = PurchaseOrder.new
  end

  test "shouldn't be valid without purchases" do
    @purchase_order.purchases.build([])
    assert_not @purchase_order.valid?
    assert_equal ["não pode ficar em branco"], @purchase_order.errors[:purchases]
  end

  test "should save with purchases from txt file" do
    assert_difference("Purchase.count", 4) do
      @purchase_order.incoming_txt_file = fixture_file('dados.txt')
      @purchase_order.save
    end
  end

  test "shouldn't save with invalid purchases" do
    assert_no_difference("Purchase.count") do
      @purchase_order.incoming_txt_file = fixture_file('dados_invalidos.txt')
      @purchase_order.save
    end
  end

  test "#gross_revenue" do
    assert_equal BigDecimal('99.95'), purchase_orders(:one).gross_revenue
  end

end
