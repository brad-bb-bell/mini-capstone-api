class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  has_many :images
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end

  # def categories
  #   categories_array = []
  #   category_products.each do |category_product|
  #     categories_array << category_product.category
  #   end
  #   return categories_array
  # end
  # ^^^ Same as has_many :categories, through: :category_products
end
