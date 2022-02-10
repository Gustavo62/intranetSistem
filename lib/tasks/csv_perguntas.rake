require 'csv'
require 'date'  
namespace :csv_perguntas do
    desc "Importa o arquivo perguntas_db.csv"
	task import: :environment do
		CSV.foreach('tmp/perguntas_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
				begin 
                    if linha[0] != "" || linha[0] != nil || linha[0].empty? == false
                        @cartorio = Intranet::Cartorio.where(cod_cns: linha[0]).take
                        if @cartorio  
                            @data_resp = Date.parse(linha[5]) 
                            @data_criacao = Date.parse(linha[6])
                            if @cartorio.intranet_associado_id
                                @pergunta = Intranet::Pergunt.create( intranet_associado_id: @cartorio.intranet_associado_id, 
                                                                    mensagem_pergunta: linha[1], 
                                                                    tipo: linha[2], 
                                                                    assunto: linha[3], 
                                                                    profissional_id: 1, 
                                                                    mensagem_resposta: linha[4], 
                                                                    status: "Respondido por: Anoreg Admin", 
                                                                    visualizada: true, 
                                                                    visualizada_at: @data_resp, 
                                                                    created_at: @data_criacao)
                                @pergunta.save
                                if @pergunta.save == false
                                    puts "TASK CRIA PERGUNT \e[41mERROR!! linha #{indice}\e[0m"
                                end 
                            end
                        end 
                    end
				rescue
					puts "TASK CRIA PERGUNT \e[41mERROR!! linha #{indice}\e[0m"
				end
			end
		end
	end
end
