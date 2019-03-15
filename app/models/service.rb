class Service < ApplicationRecord
  belongs_to :department
  belongs_to :sector
  belongs_to :service_status
  belongs_to :user
  belongs_to :service_type
  has_many :comments, dependent: :destroy
  has_many :responsibles, dependent: :destroy
  has_many :users, :through => :responsibles

  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { minimum: 6 }
  validates :body, presence: true, length: { minimum: 6 }

end
