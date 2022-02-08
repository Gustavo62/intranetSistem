require 'prawn' 
require 'enumerator'
module GeneratePdf  
    PDF_OPTIONS_PORTRAIT = { 
        :page_size   => "A4", 
        :page_layout => :portrait, 
        :margin      => [40, 75], 
    }
    PDF_OPTIONS_LANDSCAPE = { 
        :page_size   => "A4", 
        :page_layout => :landscape, 
        :margin      => [40, 15], 
    }
    def self.run_pdf(user_d,associado_d,cartorio_d,cidade_d) 
        Prawn::Document.new(PDF_OPTIONS_PORTRAIT) do |pdf|
            pdf.image "#{Rails.root}/app/javascript/stylesheets/logo.png", :at => [10,740], :width => 70, :height => 70
            pdf.draw_text "Ficha de Filiação", :at => [290,710], :size => 18, :style => :bold
            pdf.bounding_box([290,700], width: 155) do
                pdf.table([["Nº #{cartorio_d.id}-#{associado_d.id}"]], :column_widths =>[155])
            end
            pdf.bounding_box([10,630], width: 435) do
                pdf.text 'Ao Sr. Presidente do ANOREG-CE,', size: 12
                pdf.move_down 30 
                pdf.text  "Venho, através deste instrumento,requerer a filiação a essa Entidade Sindical,",     size: 12,align: :justify,character_spacing: 0.3, :leading => 1
                pdf.text  "declarando conhecer e estar de acordo com os dispositivos estatuários e com as",     size: 12,align: :justify,character_spacing: 0.08, :leading => 1
                pdf.text  "matérias aprovadas nas Assembléias Gerais, inclusive quanto à taxa de filiação e",   size: 12,align: :justify,character_spacing: 0.03, :leading => 1
                pdf.text  "contribuição associativa que vierem a ser convencionadas.",size: 12
                pdf.move_down 20 
                pdf.text  "DADOS CADASTRAIS", style: :bold, size: 8
                pdf.move_down 10 
                pdf.text  "Ofício:____________________________________________________________________________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "CPNJ:________________________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "Endereço:______________________________________________________________________  Nº:_______________", style: :bold, size: 8, :leading => 10
                pdf.text  "Bairo:_______________________________________  Cidade:______________________________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "CEP:_________________________________                                         Telefone:________________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "E-mail: ___________________________________________________________________________________________", style: :bold, size: 8, :leading => 10
                pdf.move_down 20 
                
                
                
                
                pdf.text  "DADOS DO FILIADO", style: :bold, size: 8
                pdf.move_down 10 
                pdf.text  "Nome:____________________________________________________________________________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "Cargo:    (  ) TITULAR                                                    (  ) SUBSTITUTO                                                    (  ) INTERINO", style: :bold, size: 8, :leading => 10
                pdf.text  "CPF:_________________________                                                                              RG:__________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "Endereço:______________________________________________________  Nº:_______________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "Bairo:_______________________________________ Cidade:______________________________________________", style: :bold, size: 8, :leading => 10
                pdf.text  "CEP:________________________  Telefone:________________________ Data de Nascimento:__________________", style: :bold, size: 8, :leading => 10
                pdf.move_down 30 
                pdf.text  "Fortaleza, ____ de ___________ de ______.", size: 8, :leading => 10,align: :right
                pdf.move_down 30 
                pdf.text  "_________________________________________________________", size: 8, :leading => 10,align: :center
                pdf.text  "Assinatura do Filiado", size: 8, :leading => 10,align: :center
                pdf.text  "ANOREG – CE", size: 8, :leading => 3,align: :right
                pdf.text  "Rua Walter Bezerra de Sá, 55 – Dionísio Torres.", size: 8, :leading => 3,align: :right
                pdf.text  "CEP 60.135-225, Fortaleza – Ceará",  size: 8, :leading => 3,align: :right
                pdf.text  "(85) 3433.1340 / (85) 3433.2796",  size: 8, :leading => 3,align: :right
                pdf.text  "contato@anoregce.org.br",  size: 8, :leading => 3,align: :right
                pdf.image "#{Rails.root}/app/assets/images/rodapé.jpeg", :at => [-85,-10],width: 690,height: 30
            end
            # dados cadastrais
            pdf.bounding_box([40,488], width: 400) do 
                pdf.text "#{cartorio_d.nome}", size: 8
            end
            pdf.bounding_box([40,469], width: 400) do 
                pdf.text "#{cartorio_d.cnpj}", size: 8
            end 
            pdf.bounding_box([55,449], width: 400) do 
                pdf.text "#{cartorio_d.logradouro}", size: 8
            end
            pdf.bounding_box([377,449], width: 400) do 
                pdf.text "#{cartorio_d.numero}", size: 8
            end
            pdf.bounding_box([37,430], width: 200) do 
                pdf.text "#{cartorio_d.bairro}", size: 8
            end 
            pdf.bounding_box([245,430], width: 200) do 
                pdf.text "#{cidade_d.municipio}", size: 8
            end
            pdf.bounding_box([33,410], width: 200) do 
                pdf.text "#{cartorio_d.cep}", size: 8
            end 
            pdf.bounding_box([305,410], width: 200) do 
                pdf.text "#{cartorio_d.telefone_celular}", size: 8
            end 
            pdf.bounding_box([41,391], width: 200) do 
                pdf.text "#{cartorio_d.email}", size: 8
            end 
            # dados do filiado

            pdf.bounding_box([41,332], width: 200) do 
                pdf.text "#{associado_d.nome}", size: 8
            end 
            if associado_d.funcao == "Títular"
                pdf.bounding_box([47.5,312], width: 200) do 
                    pdf.text "x", size: 8
                end 
            end
            if associado_d.funcao == "Substituto"
                pdf.bounding_box([209.5,312], width: 200) do 
                    pdf.text "x", size: 8
                end 
            end
            if associado_d.funcao == "Interino"
                pdf.bounding_box([388,312], width: 200) do 
                    pdf.text "x", size: 8
                end 
            end 
            pdf.bounding_box([34,293], width: 200) do 
                pdf.text "#{user_d.cpf}", size: 8
            end   
            pdf.bounding_box([53,273], width: 200) do 
                pdf.text "#{associado_d.logradouro}", size: 8
            end  
            pdf.bounding_box([308,273], width: 200) do 
                pdf.text "#{associado_d.complemento}", size: 8
            end  
            pdf.bounding_box([38,253], width: 200) do 
                pdf.text "#{associado_d.bairro}", size: 8
            end 
            pdf.bounding_box([242,253], width: 200) do 
                pdf.text "#{cidade_d.municipio}", size: 8
            end 
            pdf.bounding_box([34,234], width: 200) do 
                pdf.text "#{associado_d.cep}", size: 8
            end 
            pdf.bounding_box([180,234], width: 200) do 
                pdf.text "#{associado_d.telefone_1}", size: 8
            end 
            pdf.bounding_box([366,234], width: 200) do 
                pdf.text "#{associado_d.data_nascimento}", size: 8
            end              
            pdf.bounding_box([327,185], width: 200) do 
                pdf.text "#{Time.now.strftime('%d')}", size: 8
            end 
            pdf.bounding_box([355,185], width: 48) do 
                pdf.text "#{I18n.t(Time.now.strftime('%B'), scope: :month_names)}", size: 8,align: :center
            end 
            pdf.bounding_box([420,185], width: 200) do 
                pdf.text "#{Time.now.strftime('%Y')}", size: 8
            end 
            pdf.render_file("public/termo_filiacao_#{cartorio_d.id}.pdf") 
        end
    end 
    def self.relatorio_simples(ids,nome,filtro)   
        Prawn::Document.new(PDF_OPTIONS_LANDSCAPE) do |pdf|
            if filtro == ""
                filtro = "Nenhum."
            end
            @associados = Intranet::Associado.where(id: ids)
            if @associados.size % 10 == 0
                @total_paginas = @associados.size / 10
            else
                @total_paginas = (@associados.size / 10) + 1
            end
            @ids_params = ids.each_slice(10).to_a 
            @contagem = 0
            @ids_params.each do | ids_param | 
                pdf.image "#{Rails.root}/app/assets/images/logo.png", :at => [0,540], :width => 70, :height => 70
                pdf.move_down 60  
                pdf.draw_text "_________________________________________________________________________________________________________________________________________________________________________________________________________________", :at => [0, 460], :size => 7, :width => 1300 
                pdf.draw_text "ANOREG - CE", :at => [75,520], :size => 14, :style => :bold  
                
                pdf.draw_text "Relatorio De Associados. Filtros: #{filtro}.", :at => [75,495], :size => 10    
                pdf.draw_text "Gerado Por: #{nome}.", :at => [75,483], :size => 10 
                pdf.draw_text "Resumo: Total de Associados: #{@associados.size} sendo #{@associados.size - Intranet::Cartorio.all.where(adimplente: false,intranet_associado_id:@associados.ids).size.to_i } adiplentes e #{Intranet::Cartorio.all.where(adimplente: false).where(intranet_associado_id:@associados.ids).size.to_i} inadimplentes.", :at => [75,471], :size => 10 
                pdf.move_down 10 
                x = 293
                data = [["Cidade","Cartorio","Associado","CPF","Acesso","Situação"]]
                Intranet::Associado.where(id: ids_param).each do |associado| 
                    associado.intranet_cartorio.each do | assoc |
                        pdf.bounding_box([34,x+=20], width: 200) do 
                            cart   = Intranet::Cartorio.find_by_id(assoc)
                            cidade = Intranet::Cidade.find_by_id(cart.try(:intranet_cidade_id)) 
                            user   = User.find_by_id(associado.user_id) 
                            if cart.adimplente 
                                @acesso = "Liberado"
                                adimp = "Adiplente"
                            else
                                @acesso = "Restrito Pg"
                                adimp = "Inadiplente"
                            end
                            data += [["#{cidade.try(:municipio)}","#{cart.try(:nome)}","#{associado.nome}","#{user.cpf}","#{@acesso}",adimp]]
                        end 
                    end    
                end
                pdf.table(data, :header => true,:column_widths => [80,270, 200, 100, 100,61.89], :row_colors => ["F0F0F0", "bbdaff"], :cell_style => {:padding => [1, 1, 1, 10]}, :cell_style => { :size => 10})

                @contagem += 1   
                # Inclui em baixo da folha do lado direito a data e o numero da página usando a tag page
                pdf.draw_text "_________________________________________________________________________________________________________________________________________________________________________________________________________________", :at => [0, -20], :size => 7, :width => 1300 
                pdf.draw_text "Impresso em: #{(Time.now).strftime("%d/%m/%y às %H:%M")}", :at => [5, -30], :size => 7 
                pdf.draw_text "Página #{@contagem} / #{@total_paginas}", :at => [pdf.bounds.right - 45, -30], :size => 8 

                if ids_param != ids.each_slice(10).to_a.last
                    # Muda de página para incluir o outro gráfico
                    pdf.start_new_page 
                end
            end 
            pdf.render_file("public/relatorio_simples.pdf") 
        end  
        
    end 
end
