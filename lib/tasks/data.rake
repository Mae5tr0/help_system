namespace :data do
  desc 'Generae fake data'
  task fake: :environment do
    2.times do |n|
      User.create!(
          uid: "user_#{SecureRandom.uuid}",
          email: "support_#{n}@support.com",
          password: SecureRandom.uuid,
          role: User::Role::SUPPORT_MANAGER
      )
    end

    30.times do |n|
      User.create!(
          uid: "user_#{SecureRandom.uuid}",
          email: "customer_#{n}@support.com",
          password: SecureRandom.uuid,
          role: User::Role::CUSTOMER
      )
    end

    customers = User.where(role: User::Role::CUSTOMER).all

    100.times do |n|
      Ticket.create!(
          uid: "ticket_#{SecureRandom.uuid}",
          title: "Ticket_#{n}",
          content: "Content #{n}",
          user_id: customers.sample.id,
          status: Ticket::Status::OPEN
      )
    end
  end
end
