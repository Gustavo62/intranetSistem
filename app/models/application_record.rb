class ApplicationRecord < ActiveRecord::Base
  require 'rest-client'
  require 'uri'
  require 'net/http' 
  
  self.abstract_class = true
  
  def self.verificaFicha(user_id)
    @fixas_encontradas = 0
    @associado = Intranet::Associado.where(user_id: user_id).take
    @associado.intranet_cartorio.each do | cart_id | 
      @fichas    = Intranet::FixaFiliacao.where(ativo: true,user_id: user_id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id) 
      if @fichas.size != 0  
        @fixas_encontradas += 1
      end
    end  
    if @fixas_encontradas == 0 && @associado.intranet_cartorio.size < @fixas_encontradas == false
      return false
    else
      return true
    end
  end
  def self.termoPosse(user_id)
    @fixas_encontradas = 0
    @associado = Intranet::Associado.where(user_id: user_id).take
    @associado.intranet_cartorio.each do | cart_id | 
      @fichas    = Intranet::TermoPosse.where(ativo: true,user_id: user_id, intranet_associado_id: @associado.id, intranet_cartorio_id: cart_id) 
      if @fichas.size != 0  
        @fixas_encontradas += 1
      end
    end 
    if @fixas_encontradas == 0 && @associado.intranet_cartorio.size < @fixas_encontradas == false
      return false
    else
      return true
    end
  end 
  def self.geraCobranca # boletos mensalidade
    puts "Gerando remessa"
    puts "Desc: Contrib mensal"
    puts ""
    require 'date' 
    dt = Time.new().to_datetime
    dt2 = dt >> 1
    t = dt2.to_time   
    @associados =  Intranet::Associado.where.not(intranet_cartorio: nil).where('intranet_cartorio && ARRAY[?]::integer[]' [Intranet::Cartorio.all.ids.to_s])
    @associados.each do | associado |
      cartorio = Intranet::Cartorio.where(intranet_associado_id: associado.id).take
      valor_aux    = Intranet::Contribuicao.find_by_id(cartorio.try(:intranet_contribuicao_id)).try(:valor_base)
      @user       = User.find_by_id(associado.user_id) 
      @cidade     = Intranet::Cidade.find_by_id(cartorio.intranet_cidade_id) 
      if valor_aux != 0.0 && valor_aux != nil && valor_aux != ""
        valor = valor_aux 
        ## bank billet
        intranet_boleto = Intranet::Boleto.create(
          intranet_associado_id: associado.id, 
          tipo:                     "cobranca",
          metodo:                   "mensalidade",
          valor: "R$ " + valor.to_s, 
          vencimento: t, 
          status: "Aberto", 
          descricao: "Cobrança Ref ao Mês #{I18n.t "month_names.#{Time.new().strftime("%B")}"}"
        )   
        
        
        if intranet_boleto.save  
          boleto_bancario_billet = BoletoSimples::BankBillet.create(
            amount: intranet_boleto.valor.gsub("R$ ", ""),
            description: intranet_boleto.descricao,
            expire_at: intranet_boleto.vencimento,
            customer_address: (cartorio.logradouro || "Vazio")[0..254],
            customer_address_complement: (cartorio.complemento || "Vazio")[0..59],
            customer_address_number: (cartorio.numero || "Vazio")[0..9],
            customer_city_name: @cidade.estado[0..59],
            customer_cnpj_cpf: @user.cpf[0..19],
            customer_email: @user.email[0..79],
            customer_neighborhood: @cidade.municipio,
            customer_person_name: @user.nome[0..119],
            customer_person_type: 'individual',
            customer_phone_number: (cartorio.telefone_celular.gsub("-", "").gsub(" ", "").gsub("(", "").gsub(")", "") || "Vazio")[0..10],
            customer_state: 'CE',
            customer_zipcode: (associado.cep.gsub("-", "") || cartorio.cep || 'vazio')[0..7] ,
          )
          if boleto_bancario_billet.save
            intranet_boleto.id_boleto        = boleto_bancario_billet.id 
            intranet_boleto.codigo_de_barras = boleto_bancario_billet.line 
            intranet_boleto.status           = boleto_bancario_billet.status
            intranet_boleto.nosso_numero     = boleto_bancario_billet.our_number 
            intranet_boleto.url              = boleto_bancario_billet.url 
            intranet_boleto.save 
            AdminMailer.notificacao_mensal_assoc(intranet_boleto.id).deliver_later 
          else
            puts "ERROR CRIAR BILLET ASSOC_ID: " + associado.id.to_s
            puts "ERROR BILLET" + boleto_bancario_billet.response_errors.to_s
            break
          end 
        else 
          puts "ERROR CRIAR BOLETO  ASSOC_ID: " + associado.id
          puts "ERROR CRIAR ASSOC ASSOC_ID: " + associado.id
          break
        end  
      end 
    end
  end
  def self.atualizaStatusBoleto # todos os boletos
    puts "Atuaizando status dos boletos"
    @boletos          = Intranet::Boleto.where.not(status: "paid").where.not(updated_at: Date.today.all_day)
    if @boletos && @boletos.size != 0
      @boletos.each do | boleto |
        begin
          @bank_billet  = BoletoSimples::BankBillet.find(boleto.id_boleto)
        rescue
          puts "Limite por hora atingido"
          break
        end
        if @bank_billet
          boleto.status = @bank_billet.status
          boleto.save
        end
      end 
    end 
  end
  def self.atualizaSituacaoAssoc # uma vez por cada dia
    puts "Atuaizando Situação Assoc" 
    @associados  = Intranet::Associado.where(ativo: true)
    @associados.each do | associado |
      @boletos    = Intranet::Boleto.where.not(status: "paid").where(metodo: "mensalidade",intranet_associado_id: associado.id).where("vencimento < ?", (Date.today - 30).all_day)
      if @boletos.empty?  
        @cartorio = Intranet::Cartorio.where(intranet_associado_id: associado.id) 
        if @cartorio.adimplente == false 
          @cartorio.update(adimplente: true)
        end
      else
        @cartorio = Intranet::Cartorio.where(intranet_associado_id: associado.id)  
        @cartorio.update(adimplente: false)
      end
    end  
  end
end  