class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :type, presence: true

  has_one_attached :image
  belongs_to :platform, optional: true
  has_many :comments, dependent: :destroy

  scope :platform_id, -> (platform_id) { where platform_id: platform_id }
  scope :search, -> (search_term) { where "name like ?", "%#{search_term}%" }
end
