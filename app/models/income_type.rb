class IncomeType < ApplicationRecord
  validates :type_name, presence: true
end
