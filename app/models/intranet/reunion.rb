class Intranet::Reunion < ApplicationRecord
  has_many :cartorios, dependent: :destroy
end
