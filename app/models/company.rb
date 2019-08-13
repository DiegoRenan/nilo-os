class Company < ApplicationRecord
	has_many :companies
	has_many :users

	before_save { self.name = name.upcase }
	validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
