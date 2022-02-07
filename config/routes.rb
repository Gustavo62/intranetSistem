Rails.application.routes.draw do  
	namespace :intranet do
		resources :chamados
	end
	namespace :intranet do
		resources :mala_direta
	end
	namespace :intranet do
		resources :reunions  
		get '/reunions/consulta/carts', to: 'reunions#consulta_cart'   
	end
	namespace :intranet do
		resources :events  
	end
	namespace :intranet do 
		resources :arquivos, as: 'arquivos' do
			member do
				delete :delete_doc_attachment
			end
		end
	end
	require 'sidekiq/web'
	
	mount Sidekiq::Web => '/sidekiq' 
	namespace :intranet do
		resources :pergunts
	end
	namespace :intranet, path: "administrador" do
		get 'lista_usuarios/index'
		get 'lista_usuarios/deferir'
		get 'lista_usuarios/indeferir'
		get 'lista_usuarios/visualizar'
	end
	namespace :intranet do
		resources :contribuicao_importadas
	end
	namespace :intranet do
		resources :entrancia
	end
	namespace :intranet do
		resources :associados
		get '/associados/:id/acesso', to: 'associados#acesso'   
		get '/associados/relatorio/simples', to: 'associados#relatorio'  
		get '/associados/logar/associado', to: 'associados#logar_como'  
	end
	namespace :intranet do
		resources :cartorios
	end
	namespace :intranet do
		resources :boletos 
		get '/boletos/atualizar/associados', to: 'boletos#atualizaAssociados', :defaults => { :format => 'json' }
	end
	namespace :intranet do
		resources :financeiro_portadores
	end
	namespace :intranet do
		resources :financeiro_tipos_cobancas
	end
	namespace :intranet do
		resources :tabeliaos 
		get '/tabeliaos/consultar/cartorios/:id', to: 'tabeliaos#consultar_cartorios_edit' 
		get '/tabeliaos/consultar/cartorios/', to: 'tabeliaos#consultar_cartorios_new' 
	end
	namespace :intranet do
		resources :substitutos
		get '/substitutos/consultar/cartorios/:id', to: 'substitutos#consultar_cartorios_edit' 
		get '/substitutos/consultar/cartorios/', to: 'substitutos#consultar_cartorios_new' 
	end
	namespace :intranet do
		resources :arquivos_tipos
	end
	namespace :intranet do
		resources :departamentos , as: 'departamentos'  
	end 
	namespace :intranet do
		resources :privilegios   , as: 'privilegios'  
	end 
	namespace :intranet do
		resources :cidades       , as: 'cidades'   
	end 
	namespace :intranet do
		resources :entrancia     , as: 'entrancia'  
	end 
	namespace :intranet do
		resources :contribuicaos , as: 'contribuicaos'  
	end 
	namespace :intranet do
		resources :regiaos       , as: 'regiaos'  
	end 
	namespace :intranet do
		resources :atividades    , as: 'atividades'  
	end 
	namespace :intranet do  
		resources :presencs    , as: 'presencs' 
		get '/presencs/gerar/pagamento',    to: 'presencs#fazer_pagamento' 
		get '/adicionar/presenca', to: 'presencs#se_inscrever'   
	end 
	namespace :intranet do      
		resources :avisos, as: 'avisos' do
			member do
				delete :delete_doc_attachment
			end
		end
	end 
	get 'administrador/home', to: 'administrador#home'   
	get 'administrador/home/dashboard', to: 'administrador#dashboard_home'  

	get 'administrador/parametros', to: 'administrador#parametros'  
	get 'administrador/dashboard/evento', to: 'administrador#dashboard_evento' 
	get 'administrador/dashboard/cartorio', to: 'administrador#dashboard_cartorio' 
	get 'administrador/dashboard/associado', to: 'administrador#dashboard_associado' 

	get 'administrador/operadores', to: 'administrador#operador'  
	get 'administrador/operador/novo', to: 'administrador#novo_operador'
	post 'administrador/operador/novo/criar', to: 'administrador#create_novo_operador'
	get 'administrador/operador/editar', to: 'administrador#editar_operador'
	delete 'administrador/operador/deletar', to: 'administrador#deletar_operador'
	post 'administrador/operador/atualizar', to: 'administrador#update_admin'
	get "/administrador/operador/novo/admin", to: 'administrador#consulta_admin'
	get 'usuario/home', to: 'usuario#home'    
	get 'usuario/mais', to: 'usuario#mais'      
	get 'usuario/contato', to: 'usuario#contato'         
	root :to => redirect('usuario/home') 
	devise_scope :user do 
		get '/checkemail', to: 'users/registrations#emailcheck', :defaults => { :format => 'json' }
		get '/termo_filiacao', to: 'users/registrations#geratermofiliacao'  
		get '/confirmar/cadastro', to: 'users/registrations#confirmarcad', :as => :user 
		post '/confirmar/cadastro/anexa_docs', to: 'users/registrations#anexaDocFiliacao'
		post '/usuario/termo_uso/liberar', to: 'users/sessions#termoUsoLibera'
		get '/consulta/cart', to: 'users/sessions#consulta_cart'
		get '/verifica/dados/cart', to: 'users/registrations#verificaDadosCart'
		get "/consulta/user", to: 'users/registrations#consulta_user', :defaults => { :format => 'json' }
	end
	devise_for :admin, path: 'administrador', controllers: {
		:sessions => "admins/sessions",
		:registrations => "admins/registrations", 
		:confirmations => "admins/confirmations", 
		:passwords => "admins/passwords", 
		:unlocks => "admins/unlocks", 
		:omniauth => "admins/"},path_names: { sign_in:      'entrar', 
		sign_out:     'sair',
		password:     'secret',
		confirmation: 'virificação',
		unlock:       'desbloquear', 
		registration: 'registro',
		sign_up:      'cadastrar-se' } 

	devise_for :user, path: 'usuario', controllers: {
		:sessions => "users/sessions",
		:registrations => "users/registrations", 
		:confirmations => "users/confirmations", 
		:passwords => "users/passwords", 
		:unlocks => "users/unlocks", 
		:omniauth => "users/"},path_names: { sign_in:      'entrar', 
		sign_out:     'sair',
		password:     'secret',
		confirmation: 'virificação',
		unlock:       'desbloquear', 
		registration: 'registro',
		sign_up:      'cadastrar-se' }  
  
end
