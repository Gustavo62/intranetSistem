class UsuarioController < ApplicationController 
	before_action :authenticate_user!
	before_action :valida_acesso    
  	authorize_resource :class => false
	def home    
	end  
	def contato
	end
	def mais 
	end
end
