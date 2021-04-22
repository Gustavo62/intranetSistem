require "test_helper"

class IntraAdministradorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrador_home_url
    assert_response :success
  end
end
