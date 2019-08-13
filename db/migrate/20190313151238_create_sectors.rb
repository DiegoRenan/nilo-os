class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
      t.string :name, unique: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
