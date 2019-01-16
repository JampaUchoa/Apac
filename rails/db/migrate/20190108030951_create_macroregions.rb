class CreateMacroregions < ActiveRecord::Migration[5.2]
  def change
    create_table :macroregions do |t|
      t.references :state, foreign_key: true, index: true
      t.text :name, unique: true

      t.timestamps
    end
  end
end
