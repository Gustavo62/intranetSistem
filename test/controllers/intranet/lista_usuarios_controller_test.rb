require "test_helper"

class Intranet::ListaUsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get intranet_lista_usuarios_index_url
    assert_response :success
  end
end
