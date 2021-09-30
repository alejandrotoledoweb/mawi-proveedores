class Agenda < ApplicationRecord
  belongs_to :proveedor
  has_many :trabajos
end
