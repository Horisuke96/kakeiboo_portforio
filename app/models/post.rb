class Post < ApplicationRecord
  attachment :post_image

  belongs_to :user

  has_many :likes, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
end
