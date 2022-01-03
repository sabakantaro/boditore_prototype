# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title   { 'test' }
    content { 'test' }
    tag { '筋トレ' }
    image { File.open(File.join(Rails.root, 'spec/fixtures/testsample.jpg')) }
    id { 1 }
    user_id { 1 }
    association :user
  end
end
