class AdministradorController < ApplicationController
  before_action :authenticate_admin!, :valida_acesso  
  before_action :admin_params, only: %i[ create_novo_operador ] 
  before_action :set_admin, only: %i[ editar_operador deletar_operador ]
  authorize_resource :class => false

  def home  
  end 
  def dashboard_home
    @cartorios                  = Intranet::Cartorio.all
    @associados                 = Intranet::Associado.all
    @usuarios                   = User.all
    @cart_adimplente             = Intranet::Cartorio.where(adimplente: true).size
    @cartorio_cad               = @cartorios.size
    @cartorio_cad_c_assoc       = @associados.all.size
    @cartorio_cad_c_assoc_ativo = User.where(acesso: true).size 
    @cartorios_cad_ok           = @cartorios.where(cad_analise: false).size
    @cartorios_cad_analise      = @cartorios.where(cad_analise: true).size 
    @cartorios_cad_retencao     = @cartorios.where(retencao_tj: true).size
    @cartorios_cad_s_retencao   = @cartorios.where(retencao_tj: false).size
    @cartorios_c_associado_a    = @usuarios.where(acesso: true).size
    @cartorios_s_associado_a    = @usuarios.where(acesso: false).size
    @resposta                   = {
      cart_adimplente:                              @cart_adimplente,                        
      cartorio_cad:                                 @cartorio_cad,                            
      cartorio_cad_c_assoc:                         @cartorio_cad_c_assoc,            
      cartorio_cad_c_assoc_ativo:                   @cartorio_cad_c_assoc_ativo,
      cartorios_cad_ok:                             @cartorios_cad_ok,                    
      cartorios_cad_analise:                        @cartorios_cad_analise,          
      cartorios_cad_retencao:                       @cartorios_cad_retencao,        
      cartorios_cad_s_retencao:                     @cartorios_cad_s_retencao,    
      cartorios_c_associado_a:                      @cartorios_c_associado_a,      
      cartorios_s_associado_a:                      @cartorios_s_associado_a}
    respond_to do |format|  
      format.json { render json: @resposta }
    end
  end
  def parametros 
  end 
  def dashboard_evento
  end 
  def dashboard_cartorio 
  end 
  def dashboard_associado
  end 
  def operador
    @operadores = Admin.where.not(id: current_admin.id).pesquisa_por_status(params[:status]).page(params[:page]).per(10)
  end 
  def novo_operador
    @admin = Admin.new
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true)    
  end
  def create_novo_operador
    @depa = departamento_suporte(params[:departamento])
    @priv = privilegio_suporte(params[:privilegio_id]) 
    @admin = Admin.create(admin_params.merge(departamento_id: @depa,privilegio_id: @priv))
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true)   
    if @admin.save
      flash[:success] = "Usuário criado com sucesso."
      redirect_to administrador_operador_editar_path(id: @admin.id)
    end   
  end
  def editar_operador
    @edit = true if current_admin.isAdmin
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true)    
  end
  def departamento_suporte(departamento)
    departamento_array = []
    if departamento["1"] == "1"
      departamento_array << 1
    end
    if departamento["2"] == "1"
      departamento_array << 2
    end
    if departamento["3"] == "1"
      departamento_array << 3
    end
    if departamento["4"] == "1"
      departamento_array << 4
    end 
    return departamento_array
  end
  def privilegio_suporte(privilegio)
    privilegio_array = []
    if privilegio["1"] == "1"
      privilegio_array << 1
    end
    if privilegio["2"] == "1"
      privilegio_array << 2
    end
    if privilegio["3"] == "1"
      privilegio_array << 3
    end
    if privilegio["4"] == "1"
      privilegio_array << 4
    end 
    if privilegio["5"] == "1"
      privilegio_array << 5
    end
    if privilegio["6"] == "1"
      privilegio_array << 6
    end
    if privilegio["7"] == "1"
      privilegio_array << 7
    end
    if privilegio["8"] == "1"
      privilegio_array << 8
    end  
    if privilegio["9"] == "1"
      privilegio_array << 9
    end
    if privilegio["10"] == "1"
      privilegio_array << 10
    end 
    return privilegio_array
  end
  def update_admin
    @admin = Admin.find(params[:admin][:id]) 
    if params[:admin][:acesso] != "on"
      params[:admin][:acesso] = false
    end
    if params[:admin][:isAdmin] != "on"
      params[:admin][:isAdmin] = false
    end
    @privilegios = Intranet::Privilegio.where(ativo: true) 
    @dapartamentos = Intranet::Departamento.where(ativo: true) 
    if params[:admin][:password].blank?
      params[:admin][:password] = params[:admin][:current_password]
      params[:admin][:password_confirmation] = params[:admin][:current_password]
    end
    if params[:admin][:avatar].present?
      @admin.avatar.attach(params[:admin][:avatar])
    end
    if @admin.update(admin_params)  
      flash[:success] = "Usuário atualizado com sucesso."
      redirect_to administrador_operador_editar_path(id: @admin.id)
    end 
  end
  def deletar_operador
    @admin.destroy     
    flash[:success] = "Usuário deletado com sucesso."
    redirect_to administrador_operadores_path
  end
  def consulta_admin
    @admin = Admin.where(cpf: params[:cpf].remove(".").remove("-").remove(" ")).size
    
    respond_to do |format| 
      format.json { render json: @admin }
    end 
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin 
      @admin = Admin.find(params[:id])  
    end
    def admin_params
      params.require(:admin).permit(:acesso, :nome, :isAdmin, :email, :password, :password_confirmation,:cpf, :lembrete, :avatar, privilegio_id: [], departamento_id: [])
    end
end
