class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :sku, :category
end
