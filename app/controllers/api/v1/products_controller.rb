class Api::V1::ProductsController < Api::V1::ApplicationController
  def index
    @products = Product.all
  end

  def update
  end
end
