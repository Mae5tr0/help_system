FactoryGirl.define do
  factory :ticket do
    sequence(:title) { Faker::Lorem.words(3) }
    sequence(:content) { Faker::Lorem.paragraph(2) }
    user
  end
end
