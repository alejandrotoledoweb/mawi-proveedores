class Appointment < ApplicationRecord
  belongs_to :proveedor
  belongs_to :trabajo

  validates_date :date, on_or_after: lambda { Date.current }
  validates :start_time, presence: true, format: {with: /[0-9]{2}:[0]{2}/}
  validates :end_time, presence: true, format: {with: /[0-9]{2}:[0]{2}/}
  validates_time :start_time, between: ['9:00am', '4:00pm']
  validates_time :end_time, between: ['8:00am', '5:00pm']
  validates :date, presence: true

end
