namespace :data do
  desc 'Generate fake data'
  task generate: :environment do
    FactoryGirl.create_list(:customer, 10, tickets_count: 10, password: 'customer_pass')

    FactoryGirl.create_list(:support, 2, password: 'support_pass')
  end
end
