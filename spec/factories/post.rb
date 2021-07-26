FactoryBot.define do
  factory :post do
    title   { "test" }
    content { "test" }
    association :user
  end
end