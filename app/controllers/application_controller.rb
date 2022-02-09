class ApplicationController < ActionController::Base   
    before_action :configure_permitted_parameters,
        if: :devise_controller?
            protected
            after_action :valida_acesso, except: [:create] 
            def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
                devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
            end   
    def valida_acesso   
        if user_signed_in? 
            if Intranet::FixaFiliacao.verificaFicha(current_user.id) || current_user.acesso == true
                @current_ability ||= Ability.new(current_user)
                @dados_assoc    = Intranet::Associado.where(user_id: current_user.id).take
                @cart_current = Intranet::Cartorio.where(id: current_user.aux_cartorio_id).take
                @cid_current  = Intranet::Cidade.where(id: @cart_current.intranet_cidade_id).take
                @msg = []
                @adimplente = Intranet::Cartorio.find(current_user.aux_cartorio_id)
                @boletos_atrasados = Intranet::Boleto.where.not(status: "paid").where(metodo: "mensalidade",intranet_associado_id: @dados_assoc.id).where("vencimento < ?", Time.current)
                if @boletos_atrasados.size != 0  
                    @notificacao = true   
                    @msg << "Você possui #{@boletos_atrasados.size} boletos de mensalidade vencidos."   
                    @boletosnumb    = Intranet::Boleto.where(status: ["opened","generating","overdue"])
                else  
                    @avisonumb      = Intranet::Aviso.where(ativo: true, recipient_id: current_user.id, read_at: nil,master: false).order(:created_at)
                    @perguntnumb    = Intranet::Pergunt.where.not(mensagem_resposta: nil).where(visualizada: false,intranet_associado_id: current_user.id).order(:created_at) 
                    @cobrancanumb   = Intranet::Boleto.where(intranet_associado_id: @dados_assoc.id).order(:updated_at) 
                    @arquivosnumb   = Intranet::Arquivo.where.not("'#{@cart_current.id}' = ANY (cart_visualizados_ids)").where(intranet_cartorio_id: ["0",@cart_current.id]).where(ativo: true).order(:created_at)
                    @eventnumb      = Intranet::Event.where(ativo: true) 
                    @reunionnumb    = Intranet::Reunion.where('intranet_cartorio_id && ARRAY[?]::integer[]' [@cart_current.id,0])
                    @presenc        = Intranet::Presenc.all
                    @boletosnumb    = Intranet::Boleto.where(status: ["opened","generating"]).where(intranet_associado_id: @dados_assoc.id)
                    if @avisonumb.size > 0
                        @notificacao = true  
                        @msg << "Você tem que avisos que ainda não foram visualizados" 
                    end
                    if @reunionnumb.size > 0
                        @notificacao = true   
                        if @msg.size != 0
                            @msg << " novos reuniões disponiveis" 
                        else
                            @msg << "Você possui reuniões disponiveis" 
                        end
                    end  
                    if @eventnumb.size > 0
                        @notificacao = true   
                        if @msg.size != 0
                            @msg << " novos eventos disponiveis" 
                        else
                            @msg << "Você possui eventos disponiveis" 
                        end
                    end  
                    if @perguntnumb.size > 0
                        @notificacao = true   
                        if @msg.size != 0
                            @msg << " suas perguntas foram respondidas" 
                        else
                            @msg << "Você possui perguntas respondidas" 
                        end
                    end  
                    if @arquivosnumb.size > 0
                        @notificacao = true  
                        if @msg.size != 0
                            @msg << " novos arquivos para download." 
                        else
                            @msg << "Você possui novos arquivos" 
                        end
                    end 
                end
                flash[:notice] = @msg.join(',') if @msg.size > 0   
            else  
                session.destroy 
            end
        else   
            if admin_signed_in?  
                if current_admin.acesso == false
                    session.destroy  
                    link =  "<a href=\"http://www.anoregce.org.br/\">aqui</a>" 
                    flash[:info] = "Seu acesso ainda não foi liberado. Entre em contato com a Anoreg, para falar conosco clique #{link}." 
                else 
                    @current_ability ||= Ability.new(current_admin)  
                end 
            end
        end
    end    
    def reload_csrf 
        render json: { csrf: form_authenticity_token }, status: :ok
    end 
    rescue_from CanCan::AccessDenied do |exception|
        
        if user_signed_in? 
            redirect_to root_url, :alert => exception.message
        else
            if admin_signed_in? 
                redirect_to administrador_home_path, :alert => exception.message
            else
                redirect_to root_url
            end
        end
    end 
end