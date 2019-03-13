class Department < ApplicationRecord
	has_many :sectors
	validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
