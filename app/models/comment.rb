class Comment < ApplicationRecord
  validates :user, presence: true
  validates :text, presence: true
  validates :rating, presence: true
  belongs_to :product
end
