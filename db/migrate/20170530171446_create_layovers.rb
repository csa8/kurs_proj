class CreateLayovers < ActiveRecord::Migration
  def change
    create_table :layovers do |t|
      t.time :arrive_time, null: false
      t.boolean :ignor, default: false
      t.references :schedule, index: true, foreign_key: true
      t.references :station, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :layovers, [:schedule_id, :station_id], unique: true
  end
end
