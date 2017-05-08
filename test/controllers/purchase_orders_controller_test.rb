require 'test_helper'

class PurchaseOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: purchase_orders(:one)
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase order with purchases itens" do
    assert_difference('Purchase.count', 4) do
      post :create, purchase_order: { incoming_txt_file: fixture_file_upload('files/dados.txt')  }
    end
    assert_redirected_to purchase_order_path(PurchaseOrder.last)
    assert_equal "", flash[:notice]
  end

  test "shouldn't create purchase order with invalid data" do
    assert_no_difference('PurchaseOrder.count') do
      post :create, purchase_order: { incoming_txt_file: fixture_file_upload('files/dados_invalidos.txt')  }
    end
    assert_template 'new'
    assert_equal "", flash[:error]
  end

end
