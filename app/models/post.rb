class Post < ApplicationRecord
  attachment :post_image

  belongs_to :user

  default_scope -> { order(created_at: :desc) }
end
