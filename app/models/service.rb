class Service < ApplicationRecord
  belongs_to :department
  belongs_to :sector
  belongs_to :service_status
  belongs_to :user
  belongs_to :service_type
end
