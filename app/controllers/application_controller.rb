class ApplicationController < ActionController::Base  
    def valida_acesso
        @master = false
        if $user == true
            if current_user.acesso == false
                session.destroy  
                redirect_to "/usuario/entrar"
                link =  "<a href=\"http://www.sinoredice.org.br/contato/\">aqui</a>" 
                flash[:info] = "Seu acesso ainda não foi liberado. Entre em contato con o sindicato, para falar conosco clique #{link}."
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
end




#Admin.create(email: 'admin@gmail.com', nome: 'Gustavo Admin', cpf: '626.238.573-85.', acesso: true, lembrete: 'de 1 a 6', privilegio_id:1,3,5], departamento_id:[2,3], password: '123456')