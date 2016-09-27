FactoryGirl.define do
  factory :ticket do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:content) { |n| "content_#{n}" }
    user
  end
end