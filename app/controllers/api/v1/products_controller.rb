class Api::V1::ProductsController < Api::V1::ApplicationController
  def index
    @products = Product.all
    render_success(@products, :ok, root: :products)
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render_success(@product, :accepted, root: :product)
    else
      render_errors(@product.errors, 422)
    end
  end

  private

  def product_params
     params.require(:product).permit(:title, :sku, :category)
  end
end
