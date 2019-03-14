class Department < ApplicationRecord
	has_many :sectors
	has_many :users
	validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
