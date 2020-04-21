class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many_attached :images
  validates :comment, length: { maximum: 300 }
  validates :rating, presence: true
  validate :image_presence
  delegate :avatar, to: :user

  default_scope { order(created_at: :desc) }
  scope :last_five, -> { limit(5).with_attached_images }
end
