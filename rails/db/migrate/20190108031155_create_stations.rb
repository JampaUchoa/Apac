class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.references :microregion, foreign_key: true, index: true
      t.text :name, unique: true

      t.timestamps
    end
  end
end
