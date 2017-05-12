require "test_helper"

class ImportPurchaseOrderTest < Capybara::Rails::TestCase
  def  setup
    visit new_purchase_order_path
    assert_content page, "Importação/Criação de Ordem de Compra"
  end
  
  test "import purchase order txt"  do
    within '#new_purchase_order' do
      attach_file('purchase_order_uploaded_txt_file', "test/fixtures/files/dados.txt")
      click_button 'Importar'
    end
    assert_content page, "Ordem de Compra importada com sucesso"
  end

  test "import invalid purchase order txt" do
    within '#new_purchase_order' do
      attach_file('purchase_order_uploaded_txt_file', "test/fixtures/files/dados_invalidos.txt")
      click_button 'Importar'
    end
    assert_content page, "Não foi possível importar o arquivo"
  end

  test "import with empty upload file input" do
    within '#new_purchase_order' do
      click_button 'Importar'
    end
    assert_content page, "Não foi possível importar o arquivo"
  end
end
