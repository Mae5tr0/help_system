FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }

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
    role :admin
  end

  factory :support, parent: :user do
    role :support
  end

  factory :customer, parent: :user
end
