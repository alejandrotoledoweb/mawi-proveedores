class CreateTrabajos < ActiveRecord::Migration[6.1]
  def change
    create_table :trabajos do |t|
      t.integer :proveedor_id, foreign_key: true
      t.string :description
      t.date :date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
