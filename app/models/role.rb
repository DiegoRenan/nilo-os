class Role < ApplicationRecord
	has_many :tool_roles
	has_many :tools, :through => :tool_roles
	has_many :users
	
	before_save { self.name = name.downcase }
	validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
