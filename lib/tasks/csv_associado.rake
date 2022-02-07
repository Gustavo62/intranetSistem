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
        if linha[12]
          @cart = Intranet::Cartorio.where(cod_cns: linha[13]).take 
        end
        begin
          @user = User.create(  email:                linha[11], 
                                password:             "123456",  
                                nome:                 linha[4],
                                cpf:                  linha[2],
                                acesso:               @acesso,
                                lembrete:             linha[3], 
                                termo_de_uso:         false,
                                aux_cartorio_id:      nil)

          if @user.save! 
            begin 
              @ass = Intranet::Associado.create(  user_id:              @user.id, 
                                                  funcao:               "Titular", 
                                                  nome:                 linha[4], 
                                                  ativo:                @acesso, 
                                                  cep:                  linha[5], 
                                                  logradouro:           linha[6],  
                                                  complemento:          linha[7], 
                                                  bairro:               linha[8], 
                                                  telefone_1:           linha[9], 
                                                  telefone_2:           linha[10],  
                                                  email:                linha[11], 
                                                  intranet_cartorio:    "{#{@cart.id}}" ) 
              @ass.save 
              @cart.intranet_associado_id = @ass.id
              @cart.save
            rescue  
              puts "TASK CRIA ASSOC \e[41m\e[1mERROR SECOND BEGIN!!\e[22m linha #{linha[0]}\e[0m" 
            end 
          else
            puts "TASK CRIA ASSOC \e[41m\e[1mERROR USER SAVE!!\e[22m linha #{linha[0]}\e[0m"  
          end
        rescue    
          puts "TASK CRIA ASSOC \e[41m\e[1mERROR FIRST BEGIN!!\e[22m linha #{linha[0]}\e[0m" 
        end
			end
		end
	end
end
