class Service < ApplicationRecord
  belongs_to :department
  belongs_to :sector
  belongs_to :service_status
  belongs_to :user
  belongs_to :service_type
  belongs_to :company
  
  has_many :comments, dependent: :destroy
  has_many :responsibles, dependent: :destroy
  has_many :users, :through => :responsibles
  
  has_many :services_status_aberto, -> { where(status: "ABERTO") }, class_name: 'ServiceStatus'

  mount_uploader :picture, PictureUploader
  
  has_many :service_attachments
  accepts_nested_attributes_for :service_attachments

  validates :title, presence: true, length: { minimum: 6 }
  validates :body, presence: true, length: { minimum: 6 }

end
