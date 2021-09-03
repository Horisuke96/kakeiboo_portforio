class Post < ApplicationRecord
  attachment :post_image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :tags, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :post_image, presence: true
end
