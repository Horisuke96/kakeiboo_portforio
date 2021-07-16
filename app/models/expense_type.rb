class ExpenseType < ApplicationRecord
  validates :type_name, presence: true
end
