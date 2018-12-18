class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :type, presence: true
  has_one_attached :image
  belongs_to :platform, optional: true
  has_many :comments, dependent: :destroy
end
