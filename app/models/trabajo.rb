class Trabajo < ApplicationRecord

  belongs_to :proveedor

  validates :description, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
end
