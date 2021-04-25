require "test_helper"

class Intranet::AssociadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_associado = intranet_associados(:one)
  end

  test "should get index" do
    get intranet_associados_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_associado_url
    assert_response :success
  end

  test "should create intranet_associado" do
    assert_difference('Intranet::Associado.count') do
      post intranet_associados_url, params: { intranet_associado: { ativo: @intranet_associado.ativo, bairro: @intranet_associado.bairro, celular: @intranet_associado.celular, cep: @intranet_associado.cep, cidade_id: @intranet_associado.cidade_id, complemento: @intranet_associado.complemento, data_nascimento: @intranet_associado.data_nascimento, email: @intranet_associado.email, funcao: @intranet_associado.funcao, logradouro: @intranet_associado.logradouro, matricula: @intranet_associado.matricula, rg: @intranet_associado.rg, sexo: @intranet_associado.sexo, telefone_1: @intranet_associado.telefone_1, telefone_2: @intranet_associado.telefone_2, user_id: @intranet_associado.user_id, whatsapp: @intranet_associado.whatsapp } }
    end

    assert_redirected_to intranet_associado_url(Intranet::Associado.last)
  end

  test "should show intranet_associado" do
    get intranet_associado_url(@intranet_associado)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_associado_url(@intranet_associado)
    assert_response :success
  end

  test "should update intranet_associado" do
    patch intranet_associado_url(@intranet_associado), params: { intranet_associado: { ativo: @intranet_associado.ativo, bairro: @intranet_associado.bairro, celular: @intranet_associado.celular, cep: @intranet_associado.cep, cidade_id: @intranet_associado.cidade_id, complemento: @intranet_associado.complemento, data_nascimento: @intranet_associado.data_nascimento, email: @intranet_associado.email, funcao: @intranet_associado.funcao, logradouro: @intranet_associado.logradouro, matricula: @intranet_associado.matricula, rg: @intranet_associado.rg, sexo: @intranet_associado.sexo, telefone_1: @intranet_associado.telefone_1, telefone_2: @intranet_associado.telefone_2, user_id: @intranet_associado.user_id, whatsapp: @intranet_associado.whatsapp } }
    assert_redirected_to intranet_associado_url(@intranet_associado)
  end

  test "should destroy intranet_associado" do
    assert_difference('Intranet::Associado.count', -1) do
      delete intranet_associado_url(@intranet_associado)
    end

    assert_redirected_to intranet_associados_url
  end
end
