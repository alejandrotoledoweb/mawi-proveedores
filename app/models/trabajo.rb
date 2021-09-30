class Trabajo < ApplicationRecord

  belongs_to :agenda
  belongs_to :user

  validates :description, presence: true
end
