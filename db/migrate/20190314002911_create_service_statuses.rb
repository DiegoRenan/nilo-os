class CreateServiceStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :service_statuses do |t|
      t.string :status, unique: true

      t.timestamps
    end
  end
end
