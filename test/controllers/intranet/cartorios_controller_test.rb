require "test_helper"

class Intranet::CartoriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intranet_cartorio = intranet_cartorios(:one)
  end

  test "should get index" do
    get intranet_cartorios_url
    assert_response :success
  end

  test "should get new" do
    get new_intranet_cartorio_url
    assert_response :success
  end

  test "should create intranet_cartorio" do
    assert_difference('Intranet::Cartorio.count') do
      post intranet_cartorios_url, params: { intranet_cartorio: { associado_id: @intranet_cartorio.associado_id, atividade_id: @intranet_cartorio.atividade_id, bairro: @intranet_cartorio.bairro, boleto_id: @intranet_cartorio.boleto_id, cei: @intranet_cartorio.cei, cep: @intranet_cartorio.cep, cidade_id: @intranet_cartorio.cidade_id, cnpj: @intranet_cartorio.cnpj, cod_cns: @intranet_cartorio.cod_cns, cod_tj: @intranet_cartorio.cod_tj, complemento: @intranet_cartorio.complemento, contribuicao_id: @intranet_cartorio.contribuicao_id, email: @intranet_cartorio.email, entrancia_id: @intranet_cartorio.entrancia_id, forma_branca: @intranet_cartorio.forma_branca, logradouro: @intranet_cartorio.logradouro, nome: @intranet_cartorio.nome, nome_fant: @intranet_cartorio.nome_fant, nome_res: @intranet_cartorio.nome_res, numero: @intranet_cartorio.numero, observacao: @intranet_cartorio.observacao, possui_cnpj?: @intranet_cartorio.possui_cnpj?, regiao_id: @intranet_cartorio.regiao_id, substituto_id: @intranet_cartorio.substituto_id, tabeliaes_id: @intranet_cartorio.tabeliaes_id, telefone_celular: @intranet_cartorio.telefone_celular, telefone_fixo: @intranet_cartorio.telefone_fixo, whatsapp: @intranet_cartorio.whatsapp } }
    end

    assert_redirected_to intranet_cartorio_url(Intranet::Cartorio.last)
  end

  test "should show intranet_cartorio" do
    get intranet_cartorio_url(@intranet_cartorio)
    assert_response :success
  end

  test "should get edit" do
    get edit_intranet_cartorio_url(@intranet_cartorio)
    assert_response :success
  end

  test "should update intranet_cartorio" do
    patch intranet_cartorio_url(@intranet_cartorio), params: { intranet_cartorio: { associado_id: @intranet_cartorio.associado_id, atividade_id: @intranet_cartorio.atividade_id, bairro: @intranet_cartorio.bairro, boleto_id: @intranet_cartorio.boleto_id, cei: @intranet_cartorio.cei, cep: @intranet_cartorio.cep, cidade_id: @intranet_cartorio.cidade_id, cnpj: @intranet_cartorio.cnpj, cod_cns: @intranet_cartorio.cod_cns, cod_tj: @intranet_cartorio.cod_tj, complemento: @intranet_cartorio.complemento, contribuicao_id: @intranet_cartorio.contribuicao_id, email: @intranet_cartorio.email, entrancia_id: @intranet_cartorio.entrancia_id, forma_branca: @intranet_cartorio.forma_branca, logradouro: @intranet_cartorio.logradouro, nome: @intranet_cartorio.nome, nome_fant: @intranet_cartorio.nome_fant, nome_res: @intranet_cartorio.nome_res, numero: @intranet_cartorio.numero, observacao: @intranet_cartorio.observacao, possui_cnpj?: @intranet_cartorio.possui_cnpj?, regiao_id: @intranet_cartorio.regiao_id, substituto_id: @intranet_cartorio.substituto_id, tabeliaes_id: @intranet_cartorio.tabeliaes_id, telefone_celular: @intranet_cartorio.telefone_celular, telefone_fixo: @intranet_cartorio.telefone_fixo, whatsapp: @intranet_cartorio.whatsapp } }
    assert_redirected_to intranet_cartorio_url(@intranet_cartorio)
  end

  test "should destroy intranet_cartorio" do
    assert_difference('Intranet::Cartorio.count', -1) do
      delete intranet_cartorio_url(@intranet_cartorio)
    end

    assert_redirected_to intranet_cartorios_url
  end
end
