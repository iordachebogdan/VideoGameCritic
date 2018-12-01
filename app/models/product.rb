class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :type, presence: true
  has_one_attached :image
end
