require 'csv'
require 'date'
namespace :csv_boletos do
    desc "Importa o arquivo boleto_db.csv"
	task import: :environment do
		CSV.foreach('tmp/boleto_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
				begin 
                    if linha[0] != "" || linha[0] != nil || linha[0].empty? == false
                        @cartorio = Intranet::Cartorio.where(cod_cns: linha[0]).take
                        if @cartorio 
                            if linha[6].to_s == '1'
                                @boleto_pago = 'paid'
                            else 
                                @boleto_pago = 'opened'
                            end
                            @vencimento = Date.parse(linha[5])
                            @valor = "R$ " + linha[1]
                            @boleto = Intranet::Boleto.create(  intranet_associado_id: @cartorio.intranet_associado_id, 
                                                                valor: @valor, 
                                                                vencimento: @vencimento, 
                                                                descricao: linha[3], 
                                                                nosso_numero: linha[4], 
                                                                status: @boleto_pago, 
                                                                codigo_de_barras: 'Boleto da antiga base',
                                                                tipo: 'cobranca', 
                                                                metodo: 'mensalidade', 
                                                                ativo: true)
                            @boleto.save
                            if @boleto.save == false
                                puts "TASK CRIA BOLET \e[41mERROR!! linha #{indice}\e[0m"
                            end 
                        end 
                    end
				rescue
					puts "TASK CRIA BOLET \e[41mERROR!! linha #{indice}\e[0m"
				end
			end
		end
	end
end
