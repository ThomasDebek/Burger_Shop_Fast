class Extra < ApplicationRecord
  belongs_to :burger

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
