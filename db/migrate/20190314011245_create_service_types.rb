class CreateServiceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :service_types do |t|
      t.string :title, unique: true

      t.timestamps
    end
  end
end
