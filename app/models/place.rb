class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photos

  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { maximum: 140, minimum: 2 }
  validates :address, presence: true, length: { maximum: 200, minimum: 6 }
  validates :description, presence: true, length: { maximum: 500, minimum: 6 }
end
