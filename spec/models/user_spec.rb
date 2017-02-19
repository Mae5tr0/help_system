require_relative 'concerns/with_uid'

RSpec.describe User, type: :model do
  let(:user) { build(:user, role: :admin) }
  subject { user }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:auth_token) }
  it { is_expected.to respond_to(:role) }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_uniqueness_of(:auth_token) }
  it { is_expected.to allow_value('example@domain.com').for(:email) }
  it { is_expected.to have_many(:tickets).dependent(:destroy) }

  context '#generate_auth_token' do
    it 'generates a unique token' do
      allow(Devise).to receive(:friendly_token).and_return('auth_token')

      user.generate_auth_token!
      expect(user.auth_token).to eq('auth_token')
    end

    it 'generates another token when one already has been taken' do
      customer = create(:customer)
      customer.auth_token = 'auth_token'
      customer.save

      allow(Devise).to receive(:friendly_token).and_return('auth_token', 'auth_token_2')

      another_customer = create(:customer)
      expect(another_customer.auth_token).to eq('auth_token_2')
    end
  end

  it '#set_default_role' do
    user = User.create!(email: 'test@example.com', password: '12345678')

    expect(user.customer?).to be_truthy
  end

  include_examples 'with_uid'
end
