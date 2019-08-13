class ServiceAttachment < ApplicationRecord
	mount_uploader :picture, PictureUploader
   	belongs_to :service
end
