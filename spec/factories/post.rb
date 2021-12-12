# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title   { 'test' }
    content { 'test' }
    association :user
  end
end
