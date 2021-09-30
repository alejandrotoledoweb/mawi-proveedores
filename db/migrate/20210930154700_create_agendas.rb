class CreateAgendas < ActiveRecord::Migration[6.1]
  def change
    create_table :agendas do |t|
      t.integer :trabajo_id

      t.timestamps
    end
  end
end
