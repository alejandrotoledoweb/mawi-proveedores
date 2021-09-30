class Trabajo < ApplicationRecord

  belongs_to :appointment
  belongs_to :user

  validates :description, presence: true
end
