require "test_helper"

class Intranet::EntranciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_entrancium = intranet_entrancia(:one)
  end

  test "should get index" do
    get intranet_entrancia_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_entrancium_url
    assert_response :success
  end

  test "should create intranet_entrancium" do
    assert_difference('Intranet::Entrancium.count') do
      post intranet_entrancia_url, params: { intranet_entrancium: { ativo: @intranet_entrancium.ativo, descricao: @intranet_entrancium.descricao } }
    end

    assert_redirected_to intranet_entrancium_url(Intranet::Entrancium.last)
  end

  test "should show intranet_entrancium" do
    get intranet_entrancium_url(@intranet_entrancium)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_entrancium_url(@intranet_entrancium)
    assert_response :success
  end

  test "should update intranet_entrancium" do
    patch intranet_entrancium_url(@intranet_entrancium), params: { intranet_entrancium: { ativo: @intranet_entrancium.ativo, descricao: @intranet_entrancium.descricao } }
    assert_redirected_to intranet_entrancium_url(@intranet_entrancium)
  end

  test "should destroy intranet_entrancium" do
    assert_difference('Intranet::Entrancium.count', -1) do
      delete intranet_entrancium_url(@intranet_entrancium)
    end

    assert_redirected_to intranet_entrancia_url
  end
end
