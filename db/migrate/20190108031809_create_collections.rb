class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.references :station, foreign_key: true, index: true
      t.references :equipment, foreign_key: true, index: true
      t.timestamp :day
      t.float :value

      t.timestamps
    end
    add_index :collections, [:station_id, :equipment_id, :day], unique: true
  end
end
