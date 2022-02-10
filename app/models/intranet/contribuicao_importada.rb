class Intranet::ContribuicaoImportada < ApplicationRecord
    require 'roo'
    require 'http'
    require 'ostruct' 
    def self.maskCodCns(cod_cns)  
        while cod_cns.first == '0'
            cod_cns = cod_cns[1..-1]
        end 
        return cod_cns
    end
    def self.capturaNovosArquivos
        @ultima_atualiz_data = Intranet::RelatoriosContribuicao.all.order(:created_at).where(status: "sucesso").last.try(:data)
        if @ultima_atualiz_data
            @data_request        = @ultima_atualiz_data.tomorrow.strftime('%Y-%m-%d') 
            @data_atual          = (@ultima_atualiz_data.tomorrow + 33.days).strftime('%Y-%m-%d')
            @resposta            = HTTP.post("https://tjcev2.tjce.jus.br/rest/", :params => {:area => 'cartorios',:data_inicio => @data_request, :data_fim => @data_atual,:limite => '1'})
            @json_resposta = JSON.parse(@resposta.body, symbolize_names: true)  
            if @json_resposta != "Nenhum resultado encontrado..."
                @resposta_tratada = @json_resposta.map do |item|   
                    anexaBase(item[:xls],item[:data])
                end 
            else
                p "Nenhum arquivo novo, Data Consulta:#{Time.now.strftime('%Y-%m-%d')}, ref: #{@ultima_atualiz_data}"
            end 
        else 
            Intranet::RelatoriosContribuicao.create(errors_logs: "Sem arquivos de Intranet::RelatoriosContribuicao para usar de referencia.", data: nil, status: 'erro', url_link: 'vazio')
        end
    end

    def self.anexaBase(url_xls,data) 
        @total_listado      = 0
        @total_cadastrado   = 0
        @total_n_cadastrado = 0
        @contagem_errors    = 0
        @errors             = [] 
        @url_xls            = url_xls
        @sheet              = Roo::Spreadsheet.open(@url_xls)
        # mudança nos nomes  
        #cod_tj: 'CÓD. SERV.', nome:'CART.',anoreg:"ANOREG\nACERPEN (R$)"
        # mudança nos nomes ref 2021-07 
        #cod_tj: "CÓDIGO\nSERVENTIA", nome:"CÓDIGO\nSERVENTIA",anoreg:"CARTÓRIO"

        
        begin
            @sheet.each(cod_tj: 'CÓD. SERV.', nome:'CART.',anoreg:"ANOREG\nACERPEN (R$)") do |hash|
                if hash[:cod_tj] != nil && hash[:cod_tj] != 'CÓD. SERV.'  &&  hash[:cod_tj] != '' && hash[:cod_tj].size == 6
                    @total_listado += 1
                    @cod_tj = maskCodCns(hash[:cod_tj])
                    @cartorio = Intranet::Cartorio.where(cod_tj: @cod_tj).take
                    if @cartorio 
                        @valor = 0
                        if hash[:anoreg] != 0.00
                            @valor = hash[:anoreg].to_f / 2
                            @contrib = Intranet::ContribuicaoImportada.create(intranet_cartorio_id: @cartorio.id, 
                                descContrib: "Importação de cobrança Ref ao Mês #{I18n.t "month_names.#{Date.parse(data).strftime("%B")}"}", 
                                valor: @valor,
                                ano:   data)
                            if @contrib.save == false 
                                @errors[@contagem_errors] = @contrib.errors
                                @total_n_cadastrado += 1
                                @contagem_errors    += 1
                            else
                                @total_cadastrado += 1
                            end
                        end
                    end
                end
            end
            p "total listado :#{@total_listado}"
            p "total cadastr :#{@total_cadastrado}"
            if @total_listado != @total_cadastrado
                Intranet::RelatoriosContribuicao.create(errors_logs: 'Sem erros.', data: data, status: 'sucesso', url_link: url_xls)
            else
                Intranet::RelatoriosContribuicao.create(errors_logs: "Quantidade erros #{@total_n_cadastrado} detalhes: #{@errors.join(',')}", data: data, status: 'erro', url_link: url_xls)
            end
        rescue
            Intranet::RelatoriosContribuicao.create(errors_logs: "Mudança no cabeçalho", data: data, status: 'erro', url_link: url_xls)
        end
    end  

    def self.consulta_por_cart(cart_id)
        if cart_id.present?
            where(intranet_cartorio_id: cart_id)
        else
            all
        end
    end
    def self.consulta_por_ano(ano) 
        if ano.present? 
            where('extract(year  from ano) = ?', ano.first(4)).where('extract(month from ano) = ?', ano.last(2))
        else
            all
        end
    end
end