class CreateLayovers < ActiveRecord::Migration
  def change
    create_table :layovers do |t|
      t.time :arrive_time, null: false
      t.references :schedule, index: true, foreign_key: true, null: false
      t.references :station, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :layovers, [:schedule_id, :station_id], unique: true
  end
end
