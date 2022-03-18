class Admin < ApplicationRecord 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:cpf]
  validates :nome,:cpf, :email,:password_confirmation,:privilegio_id, presence: true 
  
  has_one_attached :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
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
