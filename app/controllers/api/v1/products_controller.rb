class Api::V1::ProductsController < Api::V1::ApplicationController
  def index
    case params[:filter]
    when 'sport'
      @products = Product.for_sport
    when 'music'
      @products = Product.for_music
    else
      @products = Product.all
    end
    @products = @products.order(:id).paginate(page: params[:page], per_page: 20)
    render_success(@products, :ok, total_pages: @products.total_pages)
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
    @product = Product.find(params[:id]).destroy
    render_success(@product)
  end

  private

  def product_params
     params.require(:product).permit(:title, :sku, :category)
  end
end
