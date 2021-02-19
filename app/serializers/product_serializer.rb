class ProductSerializer <  ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :description, :color_name, :zodiac_sign, :price, :image

  def price
    object.price.to_f
  end

  def image
    url_for(object.image)
  end
end
