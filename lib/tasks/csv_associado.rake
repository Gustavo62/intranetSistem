namespace :csv_associado do
  desc "Importa o arquivo associado_db.csv"
	task import: :environment do
		CSV.foreach('tmp/associado_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
        if linha[1] == 'Sim'
          @acesso = true
        else
          @acesso = true
        end
        if linha[17]
          @cart = Intranet::Cartorio.where(cod_tj: linha[17]).take
          @cart = @cart.id if @cart != nil
        end
        @user = User.create!(  email:            linha[16], 
                              password:         "123456", 
                              nome:             linha[6],
                              cpf:              linha[4],
                              acesso:           @acesso,
                              lembrete:         linha[5],
                              serventia:        linha[17])
        if @user.save!
          @ass = Intranet::Associado.create!(  user_id:              @user.id, 
                                              funcao:               "Titular", 
                                              nome:                 linha[6], 
                                              ativo:                @acesso, 
                                              cep:                  linha[7], 
                                              logradouro:           linha[8], 
                                              complemento:          linha[9], 
                                              bairro:               linha[11], 
                                              telefone_1:           linha[13], 
                                              telefone_2:           linha[14],  
                                              email:                linha[16], 
                                              intranet_cartorio_id: @cart)
          if @ass.save!
            puts "usuario salvo com sucesso linha: #{linha[0]} id usuario: #{@user.id}, id associado: #{@ass.id}"
          else
            puts "Não foi possivel salvar associado, usuario deletado linha: #{linha[0]}"
            @user.destroy 
          end
        else
          puts "Não foi possivel criar um usuario linha: #{linha[0]}"
          break
        end
			end
		end
	end
end
