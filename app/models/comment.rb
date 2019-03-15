class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  mount_uploader :picture, PictureUploader
  validates :body, presence: true,
                    length: { minimum: 5 }
end
