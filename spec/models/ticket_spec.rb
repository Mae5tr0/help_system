require 'rails_helper'
require_relative 'concerns/with_uid_spec'

RSpec.describe Ticket, type: :model do
  let(:product) { build :ticket }
  subject { product }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:uid) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:status) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to belong_to :user }

  context 'status' do
    it { is_expected.to have_state(:open) }
    it { is_expected.to allow_event(:close) }
    it { is_expected.to transition_from(:open).to(:closed).on_event(:close) }
    it { is_expected.to_not allow_transition_to(:close) }
  end

  context '#search' do
    it do
      create(:ticket, title: 'Octopus')
      entry_2 = create(:ticket, title: 'Superman')
      entry_3 = create(:ticket, title: 'Spiderman')

      expect(Ticket.search('man')).to contain_exactly(entry_2, entry_3)
    end
  end

  include_examples 'with_uid'
end
