require 'csv'
require 'date'  
namespace :csv_contrib do
    desc "Importa o arquivo contrib_db.csv"
    task import: :environment do
        CSV.foreach('tmp/contrib_db.csv', col_sep: ';').with_index do |linha, indice|
            unless (indice == 0)
                begin 
                    if linha[3] != "" || linha[3] != nil || linha[3].empty? == false
                        @cartorio = Intranet::Cartorio.where(cod_cns: linha[3]).take
                        if @cartorio
                            @valor = "R$ " + linha[0] 
                            @ano   = Date.parse(linha[1])
                            @bolt = Intranet::ContribuicaoImportada.create(intranet_cartorio_id: @cartorio.id, descContrib: "Importação de cobrança Ref ao Mês #{I18n.t "month_names.#{@ano.strftime("%B")}"}", valor: @valor,ano:   @ano) 
                            @bolt.save
                            if @bolt.save == false  
                                puts "TASK CRIA CONTRIB \e[41m\e[1mERROR!!\e[22m linha #{indice}\e[0m"
                            end
                        end
                    end
                rescue
                    puts "TASK CRIA CONTRIB \e[41mERROR!! linha #{indice}\e[0m"
                end
            end
        end
    end  
end
