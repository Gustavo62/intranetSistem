Rails.application.routes.draw do  
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
	end
	namespace :intranet do
		resources :cartorios
	end
	namespace :intranet do
		resources :boletos
	end
	namespace :intranet do
		resources :financeiro_portadores
	end
	namespace :intranet do
		resources :financeiro_tipos_cobancas
	end
	namespace :intranet do
		resources :tabeliaos
	end
	namespace :intranet do
		resources :substitutos
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
		resources :avisos        , as: 'avisos' 
	end 
	get 'administrador/home', to: 'administrador#home'  
	get 'usuario/home', to: 'usuario#home'     
	root :to => redirect('usuario/home') 
	devise_scope :user do 
		post '/checkemail', to: 'users/registrations#emailcheck'  
		get '/termo_filiacao', to: 'users/registrations#geratermofiliacao'  
		get '/confirmar/cadastro', to: 'users/registrations#confirmarcad', :as => :user
		patch '/confirmar/cadastro.:id', to: 'users/registrations#confirmarcad'
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
