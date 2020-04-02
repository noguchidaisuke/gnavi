class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many_attached :images
  validates :comment, length: { maximum: 300 }
  validates :rating, presence: true
  validate :image_presence

  def image_presence
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:image, '画像はjpegまたはpngファイルのみ有効です')
        end
      end
    end
  end

  delegate :avatar, to: :user
end
