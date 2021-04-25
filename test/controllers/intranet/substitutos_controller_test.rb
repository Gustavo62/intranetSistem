require "test_helper"

class Intranet::SubstitutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_substituto = intranet_substitutos(:one)
  end

  test "should get index" do
    get intranet_substitutos_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_substituto_url
    assert_response :success
  end

  test "should create intranet_substituto" do
    assert_difference('Intranet::Substituto.count') do
      post intranet_substitutos_url, params: { intranet_substituto: { atual?: @intranet_substituto.atual?, cpf: @intranet_substituto.cpf, dt_final: @intranet_substituto.dt_final, dt_inicio: @intranet_substituto.dt_inicio, email: @intranet_substituto.email, nome: @intranet_substituto.nome, rg: @intranet_substituto.rg, telefone: @intranet_substituto.telefone, whatsapp: @intranet_substituto.whatsapp } }
    end

    assert_redirected_to intranet_substituto_url(Intranet::Substituto.last)
  end

  test "should show intranet_substituto" do
    get intranet_substituto_url(@intranet_substituto)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_substituto_url(@intranet_substituto)
    assert_response :success
  end

  test "should update intranet_substituto" do
    patch intranet_substituto_url(@intranet_substituto), params: { intranet_substituto: { atual?: @intranet_substituto.atual?, cpf: @intranet_substituto.cpf, dt_final: @intranet_substituto.dt_final, dt_inicio: @intranet_substituto.dt_inicio, email: @intranet_substituto.email, nome: @intranet_substituto.nome, rg: @intranet_substituto.rg, telefone: @intranet_substituto.telefone, whatsapp: @intranet_substituto.whatsapp } }
    assert_redirected_to intranet_substituto_url(@intranet_substituto)
  end

  test "should destroy intranet_substituto" do
    assert_difference('Intranet::Substituto.count', -1) do
      delete intranet_substituto_url(@intranet_substituto)
    end

    assert_redirected_to intranet_substitutos_url
  end
end
