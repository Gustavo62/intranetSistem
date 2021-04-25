class Intranet::Associado < ApplicationRecord 
  validates :user_id, presence: true
  has_one :cidade
end
