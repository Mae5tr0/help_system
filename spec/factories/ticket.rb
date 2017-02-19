FactoryGirl.define do
  factory :ticket do
    sequence(:title) { Faker::Lorem.sentence }
    sequence(:content) { Faker::Lorem.paragraph(2) }
    user
  end

  factory :opened_ticket, parent: :ticket do
  end

  factory :closed_ticket, parent: :ticket do
    status Ticket::STATE_CLOSED
  end
end
