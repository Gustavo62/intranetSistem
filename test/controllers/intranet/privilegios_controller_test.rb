require "test_helper"

class Intranet::PrivilegiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_privilegio = intranet_privilegios(:one)
  end

  test "should get index" do
    get intranet_privilegios_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_privilegio_url
    assert_response :success
  end

  test "should create intranet_privilegio" do
    assert_difference('Intranet::Privilegio.count') do
      post intranet_privilegios_url, params: { intranet_privilegio: { ativo: @intranet_privilegio.ativo, descricao: @intranet_privilegio.descricao } }
    end

    assert_redirected_to intranet_privilegio_url(Intranet::Privilegio.last)
  end

  test "should show intranet_privilegio" do
    get intranet_privilegio_url(@intranet_privilegio)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_privilegio_url(@intranet_privilegio)
    assert_response :success
  end

  test "should update intranet_privilegio" do
    patch intranet_privilegio_url(@intranet_privilegio), params: { intranet_privilegio: { ativo: @intranet_privilegio.ativo, descricao: @intranet_privilegio.descricao } }
    assert_redirected_to intranet_privilegio_url(@intranet_privilegio)
  end

  test "should destroy intranet_privilegio" do
    assert_difference('Intranet::Privilegio.count', -1) do
      delete intranet_privilegio_url(@intranet_privilegio)
    end

    assert_redirected_to intranet_privilegios_url
  end
end
