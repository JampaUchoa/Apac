class CreateMicroregions < ActiveRecord::Migration[5.2]
  def change
    create_table :microregions do |t|
      t.references :macroregion, foreign_key: true, index: true
      t.text :name, unique: true

      t.timestamps
    end
  end
end
