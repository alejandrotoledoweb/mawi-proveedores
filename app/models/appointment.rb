class Appointment < ApplicationRecord
  belongs_to :trabajo
  belongs_to :proveedor

  validates_date :date, on_or_after: lambda { Date.current }
  validates :start_time, presence: true, uniqueness: true
  validates :end_time, presence: true, uniqueness: true
  validates_time :start_time, between: ['9:00am', '4:00pm']
  validates_time :end_time, between: ['8:00am', '5:00pm']
end
