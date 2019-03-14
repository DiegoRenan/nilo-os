class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.text :body
      t.references :department, foreign_key: true
      t.references :sector, foreign_key: true
      t.references :service_status, foreign_key: true
      t.string :picture
      t.references :user, foreign_key: true
      t.references :service_type, foreign_key: true

      t.timestamps
    end
  end
end
