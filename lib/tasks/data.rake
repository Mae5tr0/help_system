namespace :data do
  desc 'Generate fake data'
  task fake: :environment do
    create_list(:user, 30, tickets_count: 10)

    create(:user, 2, role: :support)

    create(:user, 1,
           role: :admin,
           email: 'admin@support.com',
           password: 'super_secret')
  end
end
