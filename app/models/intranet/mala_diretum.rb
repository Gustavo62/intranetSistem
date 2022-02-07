class Intranet::MalaDiretum < ApplicationRecord 
  has_many :cartorio
  has_rich_text :email
end
