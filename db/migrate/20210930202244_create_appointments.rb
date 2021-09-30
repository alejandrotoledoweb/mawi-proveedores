class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :trabajo, null: false, foreign_key: true
      t.references :proveedor, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
