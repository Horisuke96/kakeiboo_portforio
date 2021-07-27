class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  attachment :background_image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :expenses, dependent: :destroy

  # 退会したユーザーについて
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  # いいね機能について
  def liked_by?(post_id)
  likes.where(post_id: post_id).exists?
  end
end



