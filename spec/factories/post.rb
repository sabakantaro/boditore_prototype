# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title   { 'test' }
    content { 'test' }
    tag { '筋トレ' }
    id { 1 }
    user_id { 1 }
    association :user
  end
end
