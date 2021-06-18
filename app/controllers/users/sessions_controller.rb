# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  def new
    @cartorios = Intranet::Cartorio.all.order(:intranet_cidade_id)
		@cartorios.each do |cart|
			@cidade = Intranet::Cidade.find_by_id(cart.intranet_cidade_id)
			cart.nome = "#{@cidade.municipio} - #{cart.nome_res}"
		end
    $concluido == nil
    super 
  end
  def create
    super
  end
  def destroy
    super
  end
  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:cpf, :password, :serventia])
  end
end
