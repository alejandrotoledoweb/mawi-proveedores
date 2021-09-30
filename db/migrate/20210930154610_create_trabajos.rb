class CreateTrabajos < ActiveRecord::Migration[6.1]
  def change
    create_table :trabajos do |t|
      t.integer :proveedor_id
      t.string :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
