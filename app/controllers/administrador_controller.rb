class AdministradorController < ApplicationController
  before_action :authenticate_admin!, :valida_acesso
  $user = false
  def home
    @cart_adiplente = 0
    @cartorio_cad = Intranet::Cartorio.all.size
    @cartorio_cad_c_assoc = Intranet::Associado.all.size
    @cartorio_cad_c_assoc_ativo = User.where(acesso: true).size

    Intranet::Cartorio.all.each do |cartorio|
      if cartorio.intranet_boleto_id
        @boleto = Intranet::Boleto.find(cartorio.intranet_boleto_id)
        if @boleto.status == true
          @cart_adiplente += 1
        end
      end
    end
  end 
end
