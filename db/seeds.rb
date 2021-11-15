require 'faker'

10.times do
  Proveedor.create(
    name: Faker::Company.name
  )
end

10.times do
  Trabajo.create(
    description: Faker::Company.profession
  )
end

Appointment.create!(trabajo_id: 1, proveedor_id: 2, date: "2021-10-30", start_time: "09:00", end_time: "12:00")

Appointment.create!(trabajo_id: 2, proveedor_id: 2, date: "2021-11-14", start_time: "09:00", end_time: "12:00")

Appointment.create!(trabajo_id: 3, proveedor_id: 2, date: "2021-11-18", start_time: "09:00", end_time: "12:00")

Appointment.create!(trabajo_id: 4, proveedor_id: 2, date: "2021-12-04", start_time: "13:00", end_time: "15:00")

Appointment.create!(trabajo_id: 4, proveedor_id: 2, date: "2021-12-04", start_time: "09:00", end_time: "12:00")

Appointment.create!(trabajo_id: 4, proveedor_id: 2, date: "2021-10-04", start_time: "09:00", end_time: "12:00")

Appointment.create!(trabajo_id: 2, proveedor_id: 1, date: "2021-10-10", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 3, proveedor_id: 3, date: "2021-10-13", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 4, proveedor_id: 4, date: "2021-12-01", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 5, proveedor_id: 5, date: "2021-10-14", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 6, proveedor_id: 7, date: "2021-10-04", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 7, proveedor_id: 8, date: "2021-11-15", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 8, proveedor_id: 10, date: "2021-10-24", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 9, proveedor_id: 9, date: "2021-11-26", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 10, proveedor_id: 1, date: "2021-10-30", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 10, proveedor_id: 1, date: "2021-10-30", start_time: "09:00", end_time: "10:00")

Appointment.create!(trabajo_id: 1, proveedor_id: 1, date: "2021-10-30", start_time: "13:00", end_time: "15:00")
