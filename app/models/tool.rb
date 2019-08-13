class Tool < ApplicationRecord
	has_many :tool_roles
	has_many :roles, :through => :tool_roles
	
	before_save { self.controller = controller.downcase }

	validates :name, presence: true, length: { maximum: 100 },
									uniqueness: { case_sensitive: false }

	validates :controller, presence: true, 
						  length: { maximum: 100 },
						  uniqueness: { case_sensitive: false }
end
