require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

Appointment.create!(trabajo_id: 1, proveedor_id: 2, date: "2021-10-30", start_time: "09:00am", end_time: "12:00pm")
Appointment.create!(trabajo_id: 2, proveedor_id: 2, date: "2021-1-14", start_time: "09:00am", end_time: "12:00pm")
Appointment.create!(trabajo_id: 3, proveedor_id: 2, date: "2021-11-18", start_time: "09:00am", end_time: "12:00pm")
Appointment.create!(trabajo_id: 4, proveedor_id: 2, date: "2021-12-04", start_time: "09:00am", end_time: "12:00pm")
Appointment.create!(trabajo_id: 4, proveedor_id: 2, date: "2021-12-04", start_time: "01:00pm", end_time: "03:00pm")

Appointment.create!(trabajo_id: 2, proveedor_id: 1, date: "2021-10-10", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 3, proveedor_id: 3, date: "2021-10-13", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 4, proveedor_id: 4, date: "2021-12-01", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 5, proveedor_id: 5, date: "2021-10-14", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 6, proveedor_id: 7, date: "2021-10-04", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 7, proveedor_id: 8, date: "2021-11-15", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 8, proveedor_id: 10, date: "2021-10-24", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 9, proveedor_id: 9, date: "2021-11-26", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 10, proveedor_id: 1, date: "2021-10-30", start_time: "09:00am", end_time: "10:00am")

Appointment.create!(trabajo_id: 1, proveedor_id: 1, date: "2021-10-30", start_time: "09:00am", end_time: "10:00am")
