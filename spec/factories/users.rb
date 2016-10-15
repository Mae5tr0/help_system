FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password '12345678'
  end

  factory :admin, parent: :user do
    role User::Role::ADMIN
  end

  factory :support, parent: :user do
    role User::Role::SUPPORT
  end

  factory :customer, parent: :user do
    role User::Role::CUSTOMER
  end
end