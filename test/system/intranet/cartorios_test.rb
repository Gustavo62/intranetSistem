require "application_system_test_case"

class Intranet::CartoriosTest < ApplicationSystemTestCase
  setup do
    @intranet_cartorio = intranet_cartorios(:one)
  end

  test "visiting the index" do
    visit intranet_cartorios_url
    assert_selector "h1", text: "Intranet/Cartorios"
  end

  test "creating a Cartorio" do
    visit intranet_cartorios_url
    click_on "New Intranet/Cartorio"

    fill_in "Associado", with: @intranet_cartorio.associado_id
    fill_in "Atividade", with: @intranet_cartorio.atividade_id
    fill_in "Bairro", with: @intranet_cartorio.bairro
    fill_in "Boleto", with: @intranet_cartorio.boleto_id
    fill_in "Cei", with: @intranet_cartorio.cei
    fill_in "Cep", with: @intranet_cartorio.cep
    fill_in "Cidade", with: @intranet_cartorio.cidade_id
    fill_in "Cnpj", with: @intranet_cartorio.cnpj
    fill_in "Cod cnj", with: @intranet_cartorio.cod_cnj
    fill_in "Cod tj", with: @intranet_cartorio.cod_tj
    fill_in "Complemento", with: @intranet_cartorio.complemento
    fill_in "Contribuicao", with: @intranet_cartorio.contribuicao_id
    fill_in "Email", with: @intranet_cartorio.email
    fill_in "Entrancia", with: @intranet_cartorio.entrancia_id
    fill_in "Forma branca", with: @intranet_cartorio.forma_branca
    fill_in "Logradouro", with: @intranet_cartorio.logradouro
    fill_in "Nome", with: @intranet_cartorio.nome
    fill_in "Nome fant", with: @intranet_cartorio.nome_fant
    fill_in "Nome res", with: @intranet_cartorio.nome_res
    fill_in "Numero", with: @intranet_cartorio.numero
    fill_in "Observacao", with: @intranet_cartorio.observacao
    check "Possui cnpj?" if @intranet_cartorio.possui_cnpj?
    fill_in "Regiao", with: @intranet_cartorio.regiao_id
    fill_in "Substituto", with: @intranet_cartorio.substituto_id
    fill_in "Tabeliaes", with: @intranet_cartorio.tabeliaes_id
    fill_in "Telefone celular", with: @intranet_cartorio.telefone_celular
    fill_in "Telefone fixo", with: @intranet_cartorio.telefone_fixo
    fill_in "Whatsapp", with: @intranet_cartorio.whatsapp
    click_on "Create Cartorio"

    assert_text "Cartorio was successfully created"
    click_on "Back"
  end

  test "updating a Cartorio" do
    visit intranet_cartorios_url
    click_on "Edit", match: :first

    fill_in "Associado", with: @intranet_cartorio.associado_id
    fill_in "Atividade", with: @intranet_cartorio.atividade_id
    fill_in "Bairro", with: @intranet_cartorio.bairro
    fill_in "Boleto", with: @intranet_cartorio.boleto_id
    fill_in "Cei", with: @intranet_cartorio.cei
    fill_in "Cep", with: @intranet_cartorio.cep
    fill_in "Cidade", with: @intranet_cartorio.cidade_id
    fill_in "Cnpj", with: @intranet_cartorio.cnpj
    fill_in "Cod cnj", with: @intranet_cartorio.cod_cnj
    fill_in "Cod tj", with: @intranet_cartorio.cod_tj
    fill_in "Complemento", with: @intranet_cartorio.complemento
    fill_in "Contribuicao", with: @intranet_cartorio.contribuicao_id
    fill_in "Email", with: @intranet_cartorio.email
    fill_in "Entrancia", with: @intranet_cartorio.entrancia_id
    fill_in "Forma branca", with: @intranet_cartorio.forma_branca
    fill_in "Logradouro", with: @intranet_cartorio.logradouro
    fill_in "Nome", with: @intranet_cartorio.nome
    fill_in "Nome fant", with: @intranet_cartorio.nome_fant
    fill_in "Nome res", with: @intranet_cartorio.nome_res
    fill_in "Numero", with: @intranet_cartorio.numero
    fill_in "Observacao", with: @intranet_cartorio.observacao
    check "Possui cnpj?" if @intranet_cartorio.possui_cnpj?
    fill_in "Regiao", with: @intranet_cartorio.regiao_id
    fill_in "Substituto", with: @intranet_cartorio.substituto_id
    fill_in "Tabeliaes", with: @intranet_cartorio.tabeliaes_id
    fill_in "Telefone celular", with: @intranet_cartorio.telefone_celular
    fill_in "Telefone fixo", with: @intranet_cartorio.telefone_fixo
    fill_in "Whatsapp", with: @intranet_cartorio.whatsapp
    click_on "Update Cartorio"

    assert_text "Cartorio was successfully updated"
    click_on "Back"
  end

  test "destroying a Cartorio" do
    visit intranet_cartorios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cartorio was successfully destroyed"
  end
end
