class Sector < ApplicationRecord
  belongs_to :department
  has_many :users
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
end
