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
    let!(:product_attr) { attributes_for(:product) }
    let!(:product) { create(:product) }
    let(:update_request) { put :update, id: product.id,
                            product: product_attr }
    let(:update_response) { JSON.parse response.body }

    before { update_request }

    context 'response' do
      it 'should have status updated' do
        expect(response).to have_http_status(:accepted)
      end

      context 'should have product' do
        it { expect(update_response['product']['title']).to eq product_attr[:title] }
        it { expect(update_response['product']['sku']).to eq product_attr[:sku] }
        it { expect(update_response['product']['category']).to eq product_attr[:category] }
      end
    end

    context 'when product update' do
      it { expect(Product.find(product.id)['title']).to eq product_attr[:title] }
      it { expect(Product.find(product.id).sku).to eq product_attr[:sku] }
      it { expect(Product.find(product.id).category).to eq product_attr[:category] }
    end

  end
end
