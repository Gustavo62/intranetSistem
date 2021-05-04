require 'csv'
namespace :csv_substituto do
	desc "Importa o arquivo substituto_db.csv"
	task import: :environment do
		CSV.foreach('tmp/substituto_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
				if linha[4] == 1 or linha[4] == '1'
					@wpp = true
				else
					@wpp = true
				end
				if linha[0] == "" or linha[0] == nil
					@lastsub = Intranet::Substituto.last
					@id = @lastsub.id + 1 
				else
					@id = linha[0]
				end
				Intranet::Substituto.create!(id: @id, cpf: linha[1] , nome: linha[2], telefone: linha[3], whatsapp:linha[4], email:linha[5])
			end
		end
	end
end
