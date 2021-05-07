class ApplicationController < ActionController::Base  
    before_action :configure_permitted_parameters,
        if: :devise_controller?
            protected
            def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
                devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
            end
    def valida_acesso
        @master = false
        if $user == true
            if current_user.acesso == false
                session.destroy  
                redirect_to "/usuario/entrar"
                link =  "<a href=\"http://www.sinoredice.org.br/contato/\">aqui</a>" 
                flash[:info] = "Seu acesso ainda não foi liberado. Entre em contato con o sindicato, para falar conosco clique #{link}."
            else 
                @cart_current = Intranet::Cartorio.where(cod_tj: current_user.serventia).take
                current_user.nome = first_name(current_user.nome)
                @cid_current  = Intranet::Cidade.where(id: @cart_current.intranet_cidade_id).take
            end
        else   
            if current_admin.acesso == false
                session.destroy  
                redirect_to "/administrador/entrar"
                link =  "<a href=\"http://www.sinoredice.org.br/contato/\">aqui</a>" 
                flash[:info] = "Seu acesso ainda não foi liberado. Entre em contato con o sindicato, para falar conosco clique #{link}."
            end
            if current_admin.nome == 'Kaio Magno'
                @master = true 
            end
        end
    end
    
    def first_name(full_name)
        return full_name.split(" ")[0]+ " " +full_name.split(" ")[1]
    end
    def reload_csrf 
        render json: { csrf: form_authenticity_token }, status: :ok
      end
end




#Admin.create(email: 'admin@gmail.com', nome: 'Gustavo Admin', cpf: '626.238.573-85.', acesso: true, lembrete: 'de 1 a 6', privilegio_id:1,3,5], departamento_id:[2,3], password: '123456')