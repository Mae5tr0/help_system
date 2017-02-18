FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    role User::Role::CUSTOMER

    transient do
      tickets_count 0
    end

    after(:create) do |user, evaluator|
      if evaluator.tickets_count > 0
        create_list(:ticket, evaluator.tickets_count, user: user)
      end
    end
  end

  factory :admin, parent: :user do
    role User::Role::ADMIN
  end

  factory :support, parent: :user do
    role User::Role::SUPPORT
  end

  factory :customer, parent: :user
end