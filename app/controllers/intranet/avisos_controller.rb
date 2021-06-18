class Intranet::AvisosController < ApplicationController
	before_action :set_intranet_aviso, only: %i[ show edit update destroy ]
	before_action :valida_acesso
	# GET /intranet/avisos or /intranet/avisos.json 
	def index
		if user_signed_in? 
			@intranet_avisos = Intranet::Aviso.where(recipient_id: current_user.id,master: false).order(:created_at)
			@atividades = Intranet::Atividade.all
			@avisonumb = Intranet::Aviso.where(ativo: true, recipient_id: current_user.id, read_at: nil,master: false).order(:created_at)
			if @avisonumb.size > 0
				@numero_pushs = 0 
				@numero_pushs += @avisonumb.size
				flash[:notice] = "Você tem que ainda não foram visualizados!" 
			end
		else 
			@intranet_avisos = Intranet::Aviso.where(master: true)
			@atividades = Intranet::Atividade.all
		end
	end

	# GET /intranet/avisos/1 or /intranet/avisos/1.json
	def show
		@atividades = Intranet::Atividade.all
		if user_signed_in?
			if @intranet_aviso.recipient_id == current_user.id
				@intranet_aviso.read_at = Time.now
				@intranet_aviso.save
			end
		end
	end

	# GET /intranet/avisos/new
	def new
		@intranet_aviso = Intranet::Aviso.new
		@atividades = Intranet::Atividade.where(ativo: true)
	end

	# GET /intranet/avisos/1/edit
	def edit
		@atividades = Intranet::Atividade.all
	end

	# POST /intranet/avisos or /intranet/avisos.json
	def create 
		params[:intranet_aviso][:master] = true
		@intranet_aviso = Intranet::Aviso.new(intranet_aviso_params) 
		@atividades = Intranet::Atividade.all
		respond_to do |format|
			if @intranet_aviso.save
				Intranet::Avisos::DispararEmailAvisoJob.perform_later(@intranet_aviso)
				format.html { redirect_to @intranet_aviso, notice: "Aviso was successfully created." }
				format.json { render :show, status: :created, location: @intranet_aviso }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @intranet_aviso.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /intranet/avisos/1 or /intranet/avisos/1.json
	def update
		respond_to do |format|
		if @intranet_aviso.update(intranet_aviso_params) 
			Intranet::Avisos::AtualizarMsgJob.perform_later(@intranet_aviso)
			format.html { redirect_to @intranet_aviso, notice: "Aviso was successfully updated." }
			format.json { render :show, status: :ok, location: @intranet_aviso }
		else
			format.html { render :edit, status: :unprocessable_entity }
			format.json { render json: @intranet_aviso.errors, status: :unprocessable_entity }
		end
		end
	end

	# DELETE /intranet/avisos/1 or /intranet/avisos/1.json
	def destroy 
		Intranet::Avisos::ExcluirLoteAvisoJob.perform_later(@intranet_aviso)
		@intranet_aviso.destroy
		respond_to do |format|
			format.html { redirect_to intranet_avisos_url, notice: "Aviso was successfully destroyed." }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_intranet_aviso
			@intranet_aviso = Intranet::Aviso.find(params[:id])
		end

		# Only allow a list of trusted parameters through.
		def intranet_aviso_params
			params.require(:intranet_aviso).permit(:recipient_id, :master, :aviso,:titulo, :descricao, :ativo, :intranet_atividade_id => [],:docs => [])
		end 
end
