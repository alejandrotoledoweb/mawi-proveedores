class Proveedor < ApplicationRecord

  validates :name, presence: true
  has_one :appopintment
  has_many :trabajos, through: :appopintment
end
