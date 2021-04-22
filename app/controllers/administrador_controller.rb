class AdministradorController < ApplicationController
  before_action :authenticate_admin!, :valida_acesso
  $user = false
  def home

  end
 
end
