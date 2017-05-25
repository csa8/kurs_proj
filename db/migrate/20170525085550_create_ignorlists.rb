class CreateIgnorlists < ActiveRecord::Migration
  def change
    create_table :ignorlists do |t|
      t.references :schedule, index: true, foreign_key: true
      t.references :station, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :ignorlists, [:schedule_id, :station_id], unique: true
  end
end
