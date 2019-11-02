FactoryBot.define do
  factory :comment do
    signature { Faker::Name.name }
    content { Faker::Lorem.sentence(1, true) }
    association :user
    association :movie
  end
end
