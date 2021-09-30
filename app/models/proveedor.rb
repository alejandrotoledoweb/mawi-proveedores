class Proveedor < ApplicationRecord

  validates :name, presence: true

  has_many :trabajos
  has_one :agenda, through: :trabajos
end
