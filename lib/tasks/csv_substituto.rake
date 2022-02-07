require 'csv'
require 'date'
namespace :csv_substituto do
	desc "\e[1m\e[36mImporta o arquivo substituto_db.csv\e[0m\e[22m"
	task import: :environment do
		CSV.foreach('tmp/substituto_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0) 
				if linha[31] != "" or linha[31] != nil
					if linha[35] == "" or linha[35] == nil
						@substituicao = nil
					else
						@substituicao = Date.parse(linha[35])
					end
					if linha[28] == "" or linha[28] == nil
						@entrada = nil
					else
						@entrada = Date.parse(linha[28])
					end
					@sub = Intranet::Substituto.create(cartorio_cns: linha[1],cpf: linha[32], nome: linha[31], email:linha[33],dt_inicio: @entrada,dt_final: @substituicao,atual?: true) 
					@sub.save 
					if @sub.save == false
						puts "TASK CRIA SUBS \e[41m\e[1mERROR!!\e[22m linha #{indice}\e[0m"
					end 
				end
			end
		end
	end
end
