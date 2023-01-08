class Number < ApplicationRecord
    validates :num, uniqueness: true
    validates :num, comparison: { greater_than: 0 }
    validates :num, numericality: { only_integer: true }
end
