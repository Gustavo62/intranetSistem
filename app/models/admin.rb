class Admin < ApplicationRecord 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:cpf]
  validates :nome,:cpf, :email,:password_confirmation,:privilegio_id, presence: true 
  
  has_one_attached :avatar
  has_many :privilegios, :class_name => 'Intranet::Privilegio'
  has_many :departamentos, :class_name => 'Intranet::Departamento'
	def avatar_thumbnail
		avatar.variant(resize: "400x400!").processed
	end
  def self.pesquisa_por_status(status)
    if status.present?
      where(acesso: status)
    else
      all
    end
  end
end
