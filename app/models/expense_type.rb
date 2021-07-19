class ExpenseType < ApplicationRecord

  has_many :expenses, dependent: :destroy

  validates :type_name, presence: true
end
