class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.text :name, unique: true
      t.timestamps
    end
  end
end
