require 'rails_helper'

describe 'Products routing' do
  let(:id) { Faker::Number.number(1) }

  it { expect(get('api/v1/products')).to route_to('api/v1/products#index', format: :json) }
  it { expect(put("api/v1/products/#{id}")).to route_to('api/v1/products#update', id: id, format: :json) }
end
