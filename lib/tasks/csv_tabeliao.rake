require 'csv'
require 'date'
namespace :csv_tabeliao do
	desc "Importa o arquivo tabeliao_db.csv"
	task import: :environment do
		CSV.foreach('tmp/tabeliao_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
				begin
					@tab = Intranet::Tabeliao.create(nome: linha[22], cpf:linha[23].remove(".").remove("-").remove(" "), cartorio_cns: linha[1],atual?:true)
					@tab.save  
					if @tab.save == false  
						puts "TASK CRIA TAB \e[41m\e[1mERROR!!\e[22m linha #{indice}\e[0m"
					end
				rescue
					puts "TASK CRIA TAB \e[41mERROR!! linha #{indice}\e[0m"
				end
			end
		end
	end
end
