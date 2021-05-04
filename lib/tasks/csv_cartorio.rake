require 'csv'
require 'net/http'  
require 'cgi'  
namespace :csv_cartorio do
  desc "Importa o arquivo cartorio_db.csv"
  task import: :environment do
		CSV.foreach('tmp/cartorio_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0) 
        if linha[6] == 1 or linha[6] == "1"
          @cnpj = linha[5]
          @possui_cpj = true
          if linha[16] != '' or linha[16] != nil
            @enderecoNumero = linha[16]
          else
            @enderecoNumero = nil
          end
        else
          @cnpj = nil
          @possui_cpj = false
          if linha[16] != '' or linha[16] != nil
            @enderecoNumero = linha[16]
          else
            @enderecoNumero = nil
          end
        end 
        if linha[20] == '1' or linha[20] == 1 
          @zap = true
        else
          @zap = false
        end
        if linha[15] != '' or linha[15] != nil
          @atvs = "{#{linha[15]}}"  
        else
          @atvs = nil
        end
        # filtrando e tratando key externa
        if linha[17] != '' or linha[17] != nil
          @cidade = Intranet::Cidade.where(cod_ibge: linha[17]).take
          begin
            @cidade = @cidade.id
          rescue 
            @cidade = nil
            puts "serventia #{linha[8]}, não existe cidade com o codigo ibge: #{linha[17]}"
          end
        else
          puts "serventia #{linha[8]}, com campo 'cidade' vazio"
        end
        if linha[0] != '' or linha[0] != nil
          @intranet_entrancia_id = linha[0]
        else
          puts "nenhum entrancia com esse id #{linha[0]}",
          @intranet_entrancia_id = nil
        end 
        if linha[1] != '' or linha[1] != nil
          @intranet_regiao_id = linha[1]
        else  
          puts "nenhum regiao com esse id #{linha[1]}"
          @intranet_regiao_id = nil
        end 
        if linha[2] != '' or linha[2] != nil
          @intranet_contribuicao_id = linha[2]
        else  
          puts "nenhum contribuicao com esse id #{linha[2]}"
          @intranet_contribuicao_id = nil
        end 
        if linha[3] != '' or linha[3] != nil
          @intranet_tabeliao_id = linha[3]
        else 
          puts "nenhum tabeliao com esse id #{linha[3]}"
          @intranet_tabeliao_id = nil
        end 
        if linha[4] != '' or linha[4] != nil
          @intranet_substituto_id = linha[4]
        else 
          puts "nenhum substituto com esse id #{linha[4]}"
          @intranet_substituto_id = nil
        end
        @intranetCart = Intranet::Cartorio.create( 
                                    intranet_entrancia_id:    @intranet_entrancia_id,
                                    intranet_regiao_id:       @intranet_regiao_id,
                                    intranet_contribuicao_id: @intranet_contribuicao_id,
                                    intranet_tabeliao_id:     @intranet_tabeliao_id,
                                    intranet_substituto_id:   @intranet_substituto_id,
                                    intranet_cidade_id:       @cidade,
                                    intranet_atividade_id:    @atvs,
                                    possui_cnpj:              @possui_cpj, 
                                    cnpj:                     @cnpj,
                                    cei:                      linha[7],
                                    cod_tj:                   linha[8],
                                    cod_cnj:                  linha[9], 
                                    nome:                     linha[11], 
                                    nome_fant:                linha[12], 
                                    nome_res:                 linha[13],
                                    cep:                      linha[14], 
                                    logradouro:               linha[22], 
                                    numero:                   linha[16],
                                    bairro:                   linha[23],
                                    telefone_celular:         linha[18],
                                    telefone_fixo:            linha[19],
                                    whatsapp:                 @zap,
                                    email:                    linha[21],
                                    forma_branca:             linha[25]
        )
        if @intranetCart.save
          puts "adicionado cartorio numero #{@intranetCart.id}"
        end
			end
		end
	end
end 