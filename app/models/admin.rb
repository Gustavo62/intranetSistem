class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => {cpf: true}
  
  validates :nome,:cpf, :email,:password_confirmation,:privilegio_id, presence: true
end
