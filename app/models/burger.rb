class Burger < ApplicationRecord
  SIZES = %W[small medium large].freeze

  has_many :extras, dependent: :destroy

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :size, inclusion: { in: SIZES }, presence: true

  def available?
    @stock > 0
  end

  def size_price
    if size == "small"
      price
    elsif size == "medium"
      price + 10
    elsif size == "large"
      price + 20
    else
      price
    end
  end

  def total_price
    size_price + extras.sum(:price)
  end

  def score
    if price <= 50
      "Good"
    elsif price <= 100
      "Average"
    else
      "Not Good"
    end
  end

  def good_price?
    price <= 50
  end

  def find_extra(name)
    extras.find_by(name: name)
  end

  def expensive_extras
    extras.where("price > ?", 5)
  end

  def cheapest_extra
    extras.order(:price).first
  end

  def average_extra_price
    extras.average(:price)&.round(2) || 0
  end

end
