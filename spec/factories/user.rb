FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    profile               { 'よろしくお願いします！' }
    experience            { '5' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
