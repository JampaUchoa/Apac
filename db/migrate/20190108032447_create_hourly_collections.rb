class CreateHourlyCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :hourly_collections do |t|
      t.references :collection, foreign_key: true, index: true
      t.integer :hour
      t.float :value

      t.timestamps
    end
  end
end
