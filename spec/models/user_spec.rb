require_relative 'concerns/with_uid_spec'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  subject { user }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:auth_token) }
  it { is_expected.to respond_to(:role) }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:role) }
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
      create(:user, auth_token: 'auth_token')
      allow(Devise).to receive(:friendly_token).and_return('auth_token', 'auth_token_2')

      user.generate_auth_token!
      expect(user.auth_token).to eq('auth_token_2')
    end

    it "don't override existed token" do
      user = create(:user, auth_token: 'auth_token')
      user.generate_auth_token!

      expect(user.auth_token).to eq('auth_token')
    end
  end

  include_examples 'with_uid'
end
