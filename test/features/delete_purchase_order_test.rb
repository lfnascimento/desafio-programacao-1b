require "test_helper"

class DeletePurchaseOrderTest < Capybara::Rails::TestCase
  test "delete a purchase order" do
    visit root_path
    assert_content page, "Ordens de Compra Importadas"
    click_link "Excluir", match: :first
    assert_content page, "Ordem de Compra excluída com sucesso"
  end
end
