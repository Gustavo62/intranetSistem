class UsuarioController < ApplicationController 
  before_action :authenticate_user!, :valida_acesso 
  $user = true
  def home  
    
  end 
end
