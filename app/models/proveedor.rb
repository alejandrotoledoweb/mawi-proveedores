class Proveedor < ApplicationRecord
  has_many :appointments
  has_many :trabajos, through: :appointments

  validates :name, presence: true
end
