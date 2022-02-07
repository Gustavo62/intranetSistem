require 'csv'
require 'net/http'  
require 'cgi'
namespace :atualiza_cart_cnj do
    desc "Importa o arquivo cartorio_db.csv"
    task import: :environment do   
        CSV.foreach('tmp/cartorio_db.csv', col_sep: ';').with_index do |linha, indice|
            unless (indice == 0)    
                @cart                       = Intranet::Cartorio.where(cod_cns: linha[9]).take
                if @cart
                    @cart.cad_analise              = false
                    @cart.cod_tj                   = linha[8] if  linha[8]
                    @cart.intranet_contribuicao_id = linha[2] if  linha[2]
                    if linha[2] == "1" && linha[2] != ""
                        @cart.retencao_tj              = true
                    else
                        @cart.retencao_tj              = false
                    end
                    @cart.intranet_regiao_id       = linha[1] if  linha[1]
                    @cart.intranet_entrancia_id    = linha[0] if  linha[0]
                    @cart.save
                    if @cart.save == false
                        puts "TASK ATL CART \e[41m\e[1mERROR!!\e[22m linha #{indice.to_i + 1}\e[0m"  
                    end
                end
            end 
        end 
    end
end
