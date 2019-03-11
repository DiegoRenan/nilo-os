class User < ApplicationRecord
	has_secure_password 
	mount_uploader :picture, PictureUploader

	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }

	validates :username, presence: true, length: { maximum: 50 },
						 uniqueness: { case_sensitive: false }

	validate  :picture_size

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false },
                      uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	private

      # Validates the size of an uploaded picture.
		def picture_size
		    if picture.size > 5.megabytes
		      errors.add(:picture, "should be less than 5MB")
		    end
		end
end
