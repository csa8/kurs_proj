class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.boolean :mon, default: true
      t.boolean :tue, default: false
      t.boolean :wed, default: false
      t.boolean :thu, default: false
      t.boolean :fri, default: false
      t.boolean :sat, default: false
      t.boolean :sun, default: false
      t.integer :station_begin, null: false
      t.integer :station_end, null: false

      t.timestamps null: false
    end
  end
end
