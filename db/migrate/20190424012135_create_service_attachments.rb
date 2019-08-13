class CreateServiceAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :service_attachments do |t|
      t.integer :service_id
      t.string :picture

      t.timestamps
    end
  end
end
