namespace :csv_associado do
  desc "Importa o arquivo associado_db.csv"
	task import: :environment do
		CSV.foreach('tmp/associado_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
        if linha[1] == '1'
          @acesso = true
        else
          @acesso = true
        end
        if linha[12]
          @cart = Intranet::Cartorio.where(cod_cns: linha[13]).take 
          if @cart
            @cart_id = @cart.id
          end
        end
        if linha[11] == "" || linha[11] == nil || linha[11].empty?
          @email = @cart.email if @cart
        else
          @email = linha[11]
        end
        begin
          @user_consulta = User.where(cpf: linha[2].remove(".").remove("-").remove(" ")).take
          if @user_consulta 
            if @cart
              @associado = Intranet::Associado.where(user_id: @user_consulta.id).take
              @cart_arr  = @associado.intranet_cartorio << @cart.id
              @associado.update(intranet_cartorio: @cart_arr) 
            end
          else  
            if @email == nil || @email == ""
              @email = "email_fake_#{linha[0]}@gmail.com"
            end 
            @user = User.create(email:@email, 
              password:             "123456",  
              nome:                 linha[4],
              cpf:                  linha[2].remove(".").remove("-").remove(" "),
              acesso:               @acesso,
              lembrete:             linha[3])
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
                                                email:                @email, 
                                                intranet_cartorio:    "{#{@cart_id}}" ) 
                @ass.save 
                if @cart
                  @cart.intranet_associado_id = @ass.id 
                  @cart.save
                end
              rescue  
                puts "TASK CRIA ASSOC \e[41m\e[1mERROR SECOND BEGIN!!\e[22m linha #{linha[0]}\e[0m" 
              end 
            else
              puts "TASK CRIA ASSOC \e[41m\e[1mERROR USER SAVE!!\e[22m linha #{linha[0]}\e[0m"  
            end
          end 
        rescue    
          puts "TASK CRIA ASSOC \e[41m\e[1mERROR FIRST BEGIN!!\e[22m linha #{linha[0]}\e[0m" 
        end
			end
		end
	end
end
