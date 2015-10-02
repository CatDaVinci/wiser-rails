require 'rails_helper'

RSpec.describe Api::V1::ProductsController, :type => :controller do
  let!(:products) { create_list(:product, 100) }

  describe "GET index" do
    let(:index_request) { get :index }
    let(:index_response) { JSON.parse response.body }

    context "response" do
      before { index_request }

      it 'should have status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'have products' do
        expect(index_response["products"].count).to eq 100
      end
    end
  end

  describe "PUT update" do
    let(:product_attr) { attributes_for(:product) }
    let!(:product) { create(:product) }
    let!(:update_request) { put :update, id: product.id,
                            product: { title: product_attr[:title], sku: product_attr[:sku], category: product_attr[:category]} }
    let(:update_response) { JSON.parse response.body }

    context 'response' do
      before { update_request }

      it 'should have status updated' do
        expect(response).to have_http_status(:accepted)
      end

      it 'should have product' do
        p product_attr
        expect(update_response['product']['title']).to eq product_attr[:title]
        expect(update_response['product']['sku']).to eq product_attr[:sku]
        expect(update_response['product']['category']).to eq product_attr[:category]
      end
    end

    context 'when product update' do
      it 'should have updated product' do
        p product_attr
        expect(Product.find(product.id).title).to eq product_attr[:title]
        expect(Product.find(product.id).sku).to eq product_attr[:sku]
        expect(Product.find(product.id).category).to eq product_attr[:category]
      end
    end

  end
end
