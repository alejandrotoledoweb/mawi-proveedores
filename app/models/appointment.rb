class Appointment < ApplicationRecord
  belongs_to :trabajo
  belongs_to :proveedor

  validates_presence_of :date, :start_time, :end_time
  validates :start_time, uniqueness: true, format: {time: "%H:00"}
  validates :end_time, uniqueness: true, format: {time: "%H:00"}
end
