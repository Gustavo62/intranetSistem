namespace :criar_master do
    desc "Gera o acesso do master"
	task import: :environment do
		Admin.create!(
        email:                  "suporte@sinoredice.org.br",  
        password:               "bjTjLLeVr9",  
        password_confirmation:  "bjTjLLeVr9", 
        nome:                   "Sinoredi", 
        cpf:                    "999.999.999-99", 
        acesso:                 true, 
        lembrete:               "senha do master", 
        privilegio_id:          ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"], 
        departamento_id:        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
	end
end
