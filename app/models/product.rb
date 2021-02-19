class Product < ApplicationRecord
  include Swaggers::ProductModel

  paginates_per 30

  has_one_attached :image

  scope :filter_by_color_name, -> (color_name) { where color_name: color_name }
  scope :filter_by_zodiac_sign, -> (zodiac_sign) { where zodiac_sign: zodiac_sign }

  ZODIAC_SIGNS = %w(aries leo cancer pisces scorpio taurus sagittarius gemini virgo libra capricorn aquarius).freeze

  validates :name, :description, :color_name, presence: true
  validates :name, uniqueness: true, length: { maximum: 100 }
  validates :zodiac_sign, inclusion: ZODIAC_SIGNS
  validates :price, presence: true, format: { with:  /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :image, content_type: [:png, :jpg, :jpeg]

  def self.search(params)
    products = Product.all
    products = products.filter_by_color_name(params[:color_name]) if params[:color_name]
    products = products.filter_by_zodiac_sign(params[:zodiac_sign]) if params[:zodiac_sign]
    products
  end
end

