class Sector < ApplicationRecord
  belongs_to :department
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
