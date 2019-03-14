class Service < ApplicationRecord
  belongs_to :department
  belongs_to :sector
  belongs_to :service_status
  belongs_to :user
  belongs_to :service_type

  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { minimum: 6 }
  validates :body, presence: true, length: { minimum: 6 }

end
