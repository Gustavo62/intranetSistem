require 'csv'
require 'net/http'  
require 'cgi'  
namespace :csv_cartorio do
  desc "Importa o arquivo serventias_db.csv"
  task import: :environment do   
		CSV.foreach('tmp/serventias_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)    
        begin
          @cidade       = Intranet::Cidade.where(cod_ibge: linha[10]).take
          @tab = Intranet::Tabeliao.where(cartorio_cns: linha[1]).take
          @sub = Intranet::Substituto.where(cartorio_cns: linha[1]).take
          @atvs         = []  
          @possui_cnpj  = false 
          @atvs << linha[36] && @atvs << linha[37] && @atvs << linha[38] && @atvs << linha[39] && @atvs << linha[40] && @atvs << linha[41] && @atvs << linha[42] && @atvs << linha[43] && @atvs << linha[44] && @atvs << linha[45] && @atvs << linha[46] if linha[36] != nil or  linha[36] != "" 
          @possui_cnpj  = true if linha[2] != nil or linha[2] != ""
          @cnpj         = linha[2] if @possui_cnpj    
          if linha[3] != ''
            @intranetCart = Intranet::Cartorio.create( 
              intranet_substituto_id:   @sub.try(:id),
              intranet_tabeliao_id:     @tab.try(:id),
              situacao:                 "deferido", 
              intranet_cidade_id:       @cidade.try(:id),
              intranet_atividade_id:    @atvs,
              possui_cnpj:              @possui_cnpj, 
              cnpj:                     @cnpj,
              cod_cns:                  linha[1], 
              nome:                     linha[3], 
              cep:                      linha[16], 
              logradouro:               linha[14], 
              numero:                   linha[15],
              bairro:                   linha[11],
              telefone_celular:         linha[17],
              telefone_fixo:            linha[18],
              email:                    linha[19], 
              ativo:                    true,
              alt_usuario:              true,
              cad_analise:              true   
            )  
            if @intranetCart.save
              if @tab
                @tab.update(cart_ref_id: @intranetCart.id) 
              end
              if @sub 
                @sub.update(cart_ref_id: @intranetCart.id) 
              end 
            else 
              puts "TASK CRIA CART \e[41m\e[1mERROR!!\e[22m linha #{indice}\e[0m"
            end
          end  
        end
      end
		end
	end
end 