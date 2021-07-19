class Expense < ApplicationRecord

  belongs_to :user
  belongs_to :expense_type


  attachment :image
end
