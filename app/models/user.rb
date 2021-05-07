class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	has_one :intranet_associado, :dependent => :destroy 
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable, :authentication_keys => {cpf: true, serventia:true}
	has_one_attached :avatar
	has_one_attached :termo_posse
	has_one_attached :fixa_assinada
	has_one_attached :rg_photo_1
	has_one_attached :rg_photo_2
	has_one_attached :cpf_photo
	def avatar_thumbnail
		avatar.variant(resize: "100x100!").processed
	end
	def self.search(email)
        if email
            where('email = ?',email).first
        end 
    end
end
