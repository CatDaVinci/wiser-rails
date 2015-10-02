FactoryGirl.define do
  factory :product do
    title { Faker::App.name }
    sku { Faker::Number.number(6) }
    category { rand(0..1) }
  end
end
