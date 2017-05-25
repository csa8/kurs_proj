class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :name, null: false
      t.text :tariff, null: false
      t.integer :order_num, null: false

      t.timestamps null: false
    end
  end
end
