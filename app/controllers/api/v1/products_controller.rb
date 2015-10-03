class Api::V1::ProductsController < Api::V1::ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 20)
    render_success(@products)
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render_success(@product, :accepted)
    else
      render_errors(@product.errors, 422)
    end
  end

  def destroy
    binding.pry
    @product = Product.find(params[:id]).destroy
    render_success(@product)
  end

  private

  def product_params
     params.require(:product).permit(:title, :sku, :category)
  end
end
