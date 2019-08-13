class ChangePermissionNames < ActiveRecord::Migration[5.2]
  def up
    rename_column :tool_roles, :create, :criar
    rename_column :tool_roles, :read, :ler
    rename_column :tool_roles, :update, :atualizar
    rename_column :tool_roles, :delete, :deletar
  end
 
  def down
    rename_column :tool_roles, :criar, :create
    rename_column :tool_roles, :ler, :read
    rename_column :tool_roles, :atualizar, :update
    rename_column :tool_roles, :deletar, :delete
  end
end
