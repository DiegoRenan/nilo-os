class ToolRole < ApplicationRecord
  belongs_to :tool
  belongs_to :role

  validates :tool_id, uniqueness: { scope: :role_id }
end
