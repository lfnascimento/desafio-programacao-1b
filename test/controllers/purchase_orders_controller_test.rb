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
      post :create, purchase_order: { uploaded_txt_file: fixture_file_upload('files/dados.txt', 'text/plain') }
    end
    assert_redirected_to purchase_order_path(PurchaseOrder.last)
    assert_equal "Ordem de Compra importada com sucesso", flash[:notice]
  end

  test "shouldn't create purchase order with invalid data" do
    assert_no_difference('PurchaseOrder.count') do
      post :create, purchase_order: { uploaded_txt_file: fixture_file_upload('files/dados_invalidos.txt', 'text/plain') }
    end
    assert_template 'new'
    assert_equal "Não foi possível importar o arquivo", flash.now[:error]
  end

  test "should delete purchase_order" do
    assert_difference('Purchase.count', -2) do
      delete :destroy, id: purchase_orders(:one)
    end
    assert_redirected_to purchase_orders_path
    assert_equal "Ordem de Compra excluída com sucesso", flash[:notice]
  end

end
