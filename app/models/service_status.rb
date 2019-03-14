class ServiceStatus < ApplicationRecord
	before_save { self.status = status.upcase }
	validates :status, presence: true, length: { minimum: 2 }
end
