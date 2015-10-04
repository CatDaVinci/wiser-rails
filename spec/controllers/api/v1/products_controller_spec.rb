require 'rails_helper'

RSpec.describe Api::V1::ProductsController, :type => :controller do
  before do
    products if defined?(products)
    request
  end

  let(:response_body) { JSON.parse response.body }

  describe "GET index" do
    let(:request) { get :index }
    let(:products) { create_list(:product, 100) }

    context "response" do
      it('should have status ok') { expect(response).to have_http_status(:ok) }
      it('have products') { expect(response_body.count).to eq 20 }
    end
  end

  describe "GET index with filter" do
    let(:products) { create_list(:product, 100) }
    context 'for sport' do
      let(:request) { get :index, filter: 'sport' }
      it('should have status ok') { expect(response).to have_http_status(:ok) }
      it('have products') { expect(response_body.count).to eq 20 }
    end

    context 'for music' do
      let(:request) { get :index, filter: 'music' }
      it('should have status ok') { expect(response).to have_http_status(:ok) }
      it('have products') { expect(response_body.count).to eq 20 }
    end
  end

  describe "PUT update" do
    let(:product_attrs) { attributes_for(:product) }
    let(:product) { create(:product) }
    let(:request) { put :update, id: product.id, product: product_attrs }

    it('should have status updated') { expect(response).to have_http_status(:accepted) }
    it { expect(response_body['title']).to eq product_attrs[:title] }
    it { expect(response_body['sku']).to eq product_attrs[:sku] }
    it { expect(response_body['category']).to eq product_attrs[:category] }
    it { expect(product.reload.title).to eq product_attrs[:title] }
    it { expect(product.reload.sku).to eq product_attrs[:sku] }
    it { expect(product.reload.category).to eq product_attrs[:category] }
  end

  describe 'DELETE destroy' do
    let(:product) { create(:product) }
    let(:request) { delete :destroy, id: product.id }

    it('should have status ok') { expect(response).to have_http_status(:ok) }
  end
end
