# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(object)  
    return unless object.present?   
    if object.class.name == "Admin"   
      can :home,                  :administrador
      can :dashboard_home,        :administrador
      can :gerarBolteto,:boleto
      if object.privilegio_id.include?(1)
        can :manage, :all
      end       
      if object.privilegio_id.include?(2)
        can :manage,        :aviso   
      end
      if object.privilegio_id.include?(3)
        can :manage,        :event 
        can :dashboard_evento, :administrador
      end
      if object.privilegio_id.include?(4)
        can :manage,        :arquivo
        can :manage,        :arquivos_tipo
      end
      if object.privilegio_id.include?(5)
        can :manage,        :reunion  
      end
      if object.privilegio_id.include?(6)
        can     :read,      :pergunt 
        cannot  :create,    :pergunt
        can     :update,    :pergunt
        can     :destroy,   :pergunt
      end
      if object.privilegio_id.include?(7)
        can :manage,        :boleto  
        can :gerarBolteto,  :boleto
      end
      if object.privilegio_id.include?(8)
        can :manage,        :mala_diretum
      end
      if object.privilegio_id.include?(9)
        can :dashboard_cartorio, :administrador
        can :dashboard_associado, :administrador 
        can :manage,        :associado
        can :manage,        :cartorio
        can :manage,        :substituto
        can :manage,        :tabeliao 

        
        can     :read,      :presenc 
        cannot  :new,       :presenc
        cannot  :edit,      :presenc 
        can     :destroy,   :presenc
      end
      if object.privilegio_id.include?(10)
        can :operador,              :administrador
        can :novo_operador,         :administrador
        can :create_novo_operador,  :administrador
        can :editar_operador,       :administrador
        can :deletar_operador,      :administrador
        can :consulta_admin,        :administrador
        can :update_admin,          :administrador 
        
        can :manage,        :departamento
        can :manage,        :privilegio
        can :manage,        :regiao
        can :manage,        :atividade
        can :manage,        :entrancium
        can :manage,        :contribuicao 
        
        can :manage,        :cidade
        can :manage,        :chamado
        can :manage,        :contribuicao_importada
        can :manage,        :lista_usuario
        can     :read,      :presenc 
        cannot  :new,       :presenc
        cannot  :edit,      :presenc 
        can     :destroy,   :presenc
      end 
    else 
      # Rotas Principais USER
      can :home,    :usuario
      can :contato, :usuario 
      can :mais,    :usuario 
      @adimplente = Intranet::Cartorio.find(object.aux_cartorio_id).adimplente
      puts "------------------------"
      puts @adimplente
      if @adimplente
        # bloco AVISO
        can    :read,    :aviso 
        cannot :new,     :aviso
        cannot :edit,    :aviso 
        cannot :destroy, :aviso
        
        # bloco PERGUNTA
        can    :manage,  :pergunt

        # bloco ARQUIVO
        can    :read,    :arquivo 
        cannot :new,     :arquivo
        cannot :edit,    :arquivo 
        cannot :destroy, :arquivo 
        
        # bloco EVENTO
        can    :read,    :event 
        cannot :new,     :event
        cannot :edit,    :event 
        cannot :destroy, :event  
        
        # bloco REUNIÂO
        can    :read,    :reunion 
        cannot :new,     :reunion
        cannot :edit,    :reunion 
        cannot :destroy, :reunion  
        
        # bloco BOLETO
        can    :read,    :boleto 
        can    :gerarBolteto, :boleto
        cannot :new,     :boleto
        cannot :edit,    :boleto 
        cannot :destroy, :boleto   
        
        # bloco ARQUIVOS TIPO
        cannot :manage,        :arquivos_tipo
        
        # bloco ATIVIDADES
        cannot :manage,        :atividade
        
        # bloco CIDADE
        cannot :manage,        :cidade
        
        # bloco CHAMADO
        cannot :manage,        :chamado

        # bloco CARTORIOS
        cannot :manage,        :cartorio

        # bloco CONTRIBUIÇÃO
        cannot :manage,        :contribuicao

        # bloco CONTRIBUIÇÃO IMPORTADA
        cannot :manage,        :contribuicao_importada
        
        # bloco DEPARTAMENTO
        cannot :manage,        :departamento

        # bloco ENTRÂNCIAS
        cannot :manage,        :entrancium

        # bloco LISTA DE USUARIOS
        cannot :manage,        :lista_usuario

        # bloco MALA DIRETA
        cannot :manage,        :mala_diretum

        # bloco PRESENÇA 
        can    :manage,        :presenc  

        # bloco PRIVILEGIO
        cannot :manage,        :privilegio
        
        # bloco REGIÃO
        cannot :manage,        :regiao
        
        # bloco SUBSTITUTO
        cannot :manage,        :substituto

        # bloco TABELIÃO
        cannot :manage,        :tabeliao
      else
        # bloco BOLETO
        can    :read,         :boleto 
        can    :gerarBolteto, :boleto
        cannot :new,          :boleto
        cannot :edit,         :boleto
        cannot :destroy,      :boleto   
      end

      
    end
  end
end
