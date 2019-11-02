FactoryBot.define do
  factory :comment do
    signature { Faker::Name.name }
    content { Faker::Lorem.sentence(1, true) }
    association :user
    association :movie
    created_at Time.now

    trait :with_date do
      created_at { 14.days.ago }
    end


  end
end
