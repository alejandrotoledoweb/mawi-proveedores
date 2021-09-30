class Proveedor < ApplicationRecord

  validates :name, presence: true
  has_one :agenda
  has_many :trabajos, through: :agenda
end
