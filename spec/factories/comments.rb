FactoryBot.define do
  factory :comment do
    user_id { 1 }
    post_id { 1 }
    text { "パワー！" }

    association :user, factory: :user
    association :post, factory: :post
  end
end
