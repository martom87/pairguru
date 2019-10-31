FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password 'password'
    password_confirmation 'password'
    phone_number {'+48 999 888 777'}
    name {Faker::Name.name}
  end
end





