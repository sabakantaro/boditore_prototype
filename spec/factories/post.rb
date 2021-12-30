# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title   { 'test' }
    content { 'test' }
    tag { '筋トレ' }
    association :user
  end
end
