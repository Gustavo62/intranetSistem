class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nome,:cpf, :email,:password_confirmation,:privilegio_id, presence: true
end
