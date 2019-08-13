class ServiceType < ApplicationRecord
	validates :title, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
