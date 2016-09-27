require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let(:support) { FactoryGirl.create(:user, role: 'support') }
  let(:customer) { FactoryGirl.create(:user, role: 'customer') }

  context 'admin' do
    subject(:ability) { Ability.new(admin) }

    it { expect(ability).to be_able_to(:manage, :all) }
  end

  context 'support' do
    subject(:ability) { Ability.new(admin) }

    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
  end

  context 'customer' do
    subject(:ability) { Ability.new(admin) }

    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
    it { expect(ability).to be_able_to(:manage, :all) }
  end
end
