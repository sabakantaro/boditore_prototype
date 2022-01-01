# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    profile               { 'よろしくお願いします！' }
    experience            { '5' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end

  factory :other_user, class: User do
    name { 'なかやまぜいにくん' }
    email { 'power@example.com' }
    profile               { 'パワー！' }
    experience            { '10' }
    password { 'itsmylife' }
    password_confirmation { 'itsmylife' }
  end
end
