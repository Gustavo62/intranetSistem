class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	validates :cpf, presence: true, uniqueness: { case_sensitive: false }
	has_one :intranet_associado, :dependent => :destroy 
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable

end
