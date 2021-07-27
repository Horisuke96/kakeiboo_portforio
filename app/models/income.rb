class Income < ApplicationRecord

  belongs_to :user
  belongs_to :income_type

  attachment :image


end
