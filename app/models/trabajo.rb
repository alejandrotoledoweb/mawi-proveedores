class Trabajo < ApplicationRecord
  has_many :appointments
  has_many :proveedor, through: :appointments
  
  validates :description, presence: true
end
