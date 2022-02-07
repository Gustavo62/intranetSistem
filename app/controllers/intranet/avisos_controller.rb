class Intranet::AvisosController < ApplicationController
	before_action :valida_acesso
	before_action :set_intranet_aviso, only: %i[ show edit update destroy ] 
	authorize_resource :class => false
	def index
		if user_signed_in? 
			@msg = []
			@intranet_avisos = Intranet::Aviso.where(recipient_id: current_user.id,master: false).order(:created_at)
			@atividades = Intranet::Atividade.all
		else   
			if params[:id_atividade].present?
				@intranet_avisos = Intranet::Aviso.where(master: true).pesquisa(params[:status]).where("intranet_atividade_id &&  ?", "{#{params[:id_atividade]}}")
			else
				@intranet_avisos = Intranet::Aviso.where(master: true).pesquisa(params[:status])
			end
			@atividades = Intranet::Atividade.all
		end
	end
	
	def show
		@atividades = Intranet::Atividade.all
		if user_signed_in?
			if @intranet_aviso.recipient_id == current_user.id
				@intranet_aviso.read_at = Time.now
				@intranet_aviso.save
			end
		end
	end

	def delete_doc_attachment
		@doc = ActiveStorage::Attachment.find(params[:idb])
		@doc.purge  
		flash[:notice] = "Documento Deletado" 
		redirect_to intranet_aviso_path(params[:ida])
	end
	
	def new
		@intranet_aviso = Intranet::Aviso.new
		@atividades = Intranet::Atividade.where(ativo: true)
	end
	
	def edit
		@atividades = Intranet::Atividade.all
	end
	
	def create 
		params[:intranet_aviso][:master] = true
		@intranet_aviso = Intranet::Aviso.new(intranet_aviso_params) 
		@atividades = Intranet::Atividade.all
		respond_to do |format|
			if @intranet_aviso.save
				Intranet::Avisos::DispararEmailAvisoJob.perform_later(@intranet_aviso)
				format.html { redirect_to @intranet_aviso, notice: "Aviso foi criado com sucesso." }
				format.json { render :show, status: :created, location: @intranet_aviso }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @intranet_aviso.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def update
		respond_to do |format|
		if @intranet_aviso.update(intranet_aviso_params) 
			Intranet::Avisos::AtualizarMsgJob.perform_later(@intranet_aviso)
			format.html { redirect_to @intranet_aviso, notice: "Aviso foi atualizado com sucesso." }
			format.json { render :show, status: :ok, location: @intranet_aviso }
		else
			format.html { render :edit, status: :unprocessable_entity }
			format.json { render json: @intranet_aviso.errors, status: :unprocessable_entity }
		end
		end
	end
	
	def destroy 
		Intranet::Avisos::ExcluirLoteAvisoJob.perform_later(@intranet_aviso)
		@intranet_aviso.destroy
		respond_to do |format|
			format.html { redirect_to intranet_avisos_url, notice: "Aviso  foi deletado com sucesso." }
			format.json { head :no_content }
		end
	end
	
	private
	
		def set_intranet_aviso
			@intranet_aviso = Intranet::Aviso.find(params[:id])
		end
		
		def intranet_aviso_params
			params.require(:intranet_aviso).permit(:recipient_id, :master, :aviso,:titulo, :descricao, :ativo, :intranet_atividade_id => [],:docs => [])
		end 
end
