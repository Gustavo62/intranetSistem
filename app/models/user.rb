class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	has_one :intranet_associado, :dependent => :destroy 
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable, :authentication_keys => {cpf: true, serventia:true}
	has_one_attached :avatar
	def avatar_thumbnail
		avatar.variant(resize: "100x100!").processed
	end

end
