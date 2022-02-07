class Intranet::Boleto < ApplicationRecord 
  def self.pesquisa_bolet(status)
    if status.present?  
      if status == "0"
        where(status: "Pago") 
      else 
        where(status: "Aberto")
      end
    else
      all
    end
  end
  
  def self.createBoleto(cobranca,id_cart)
    @associado  = Intranet::Associado.find_by_id(cobranca.intranet_associado_id)
    @user       = User.find_by_id(@associado.user_id)
    @cartorio   = Intranet::Cartorio.find_by_id(id_cart)
    @cidade     = Intranet::Cidade.find_by_id(@cartorio.intranet_cidade_id) 

    @boleto = BoletoSimples::BankBillet.new(
      amount: cobranca.valor.gsub("R$ ", ""),
      description: cobranca.descricao,
      expire_at: cobranca.vencimento,
      customer_address: @cartorio.logradouro || "Vazio",
      customer_address_complement: @cartorio.complemento || "Vazio",
      customer_address_number: @cartorio.numero || "Vazio",
      customer_city_name: @cidade.estado,
      customer_cnpj_cpf: @user.cpf,
      customer_email: @user.email,
      customer_neighborhood: @cidade.municipio,
      customer_person_name: @user.nome,
      customer_person_type: 'individual',
      customer_phone_number: @cartorio.telefone_celular || "Vazio",
      customer_state: 'CE',
      customer_zipcode: @associado.cep || @cartorio.cep
    ) 
    if @boleto.save 
      @boleto = BoletoSimples::BankBillet.find(@boleto.id)
      cobranca.id_boleto        = @boleto.id 
      cobranca.codigo_de_barras = @boleto.line 
      cobranca.nosso_numero     = @boleto.our_number 
      cobranca.status           = @boleto.status
      cobranca.url              = @boleto.url
      cobranca.save  
      AdminMailer.notificacao_mensal_assoc(cobranca.id).deliver_later
    else
      puts "-----------------------"
      puts @boleto.response_errors
    end
  end
end
