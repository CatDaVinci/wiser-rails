FactoryGirl.define do
  factory :product do
    title { Faker::App.name }
    sku { Faker::Number.number(6).to_i }
    category { ["sport", "music"].sample }
  end
end
