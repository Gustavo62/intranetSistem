namespace :criar_master do
    desc "Gera o acesso do master"
	task import: :environment do
		Admin.create!(
        isAdmin:                true,
        email:                  "anoregce@anoregce.org.br",  
        password:               "123456",  
        password_confirmation:  "123456", 
        nome:                   "Anoreg Admin", 
        cpf:                    "999.999.999-99", 
        acesso:                 true, 
        lembrete:               "senha do master 123456", 
        privilegio_id:          ["1"], 
        departamento_id:        ["1", "2", "3", "4"])
	end
end
