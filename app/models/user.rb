class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable  
	has_one  :associados, :class_name => 'Intranet::Associado', dependent: :destroy

	devise :database_authenticatable, :registerable,:timeoutable,
			:recoverable, :rememberable, :validatable, :authentication_keys => {cpf:true}
	has_one_attached :avatar
	has_one_attached :termo_posse 
	has_one_attached :rg_photo_1
	has_one_attached :rg_photo_2
	has_one_attached :cpf_photo
	validates :cpf, uniqueness: { case_sensitive: false } 
	def avatar_thumbnail
		avatar.variant(resize: "400x400!").processed
	end
	def self.search(email)
        if email
            where('email = ?',email).first
        end 
    end
	def will_save_change_to_email?
		false
	end
	def email_required?
		false
	end

	def email_changed?
		false
	end
end
