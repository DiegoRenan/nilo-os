class CreateToolRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :tool_roles do |t|
      t.references :tool, foreign_key: true
      t.references :role, foreign_key: true
      t.boolean :read, default: false
      t.boolean :create, default: false
      t.boolean :update, default: false
      t.boolean :delete, default: false

      t.timestamps
    end
  end
end
