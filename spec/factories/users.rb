FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '111111a' }
    password_confirmation { '111111a' }
  end
end
