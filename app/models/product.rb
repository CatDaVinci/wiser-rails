class Product < ActiveRecord::Base
  enum category: [:sport, :music]

  validates :title, :sku, :category, presence: true
  validates :title, length: { maximum: 30 }
  validates :sku, numericality: { greater_than_or_equel_to: 0, less_than_or_equal_to: 1000000 }
  validates :category, inclusion: { in: Product.categories.keys }

  scope :for_sport, -> { where(category: 'sport') }
  scope :for_music, -> { where(category: 'music') }
end
