class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string :name, unique: true
      t.string :controller, unique: true

      t.timestamps
    end
  end
end
