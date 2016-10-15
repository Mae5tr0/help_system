require 'rails_helper'

RSpec.describe UserPolicy do
  let!(:customer) { create(:customer) }
  let!(:another_customer) { create(:customer) }
  let!(:admin) { create(:admin) }
  let!(:support) { create(:support) }

  subject { described_class }
  let(:resolved_scope) { described_class::Scope.new(user, User.all).resolve }

  context 'customer' do
    let(:user) { customer }

    permissions :show? do
      it 'customer can view only self' do
        is_expected.to permit(user, user)
        is_expected.not_to permit(user, another_customer)
      end
    end

    permissions :update? do
      it { is_expected.not_to permit(user, user) }
    end

    it 'list only self' do
      expect(resolved_scope).to contain_exactly(user)
    end
  end

  context 'support' do
    let(:user) { support }

    permissions :show? do
      it 'can view all users except admin' do
        is_expected.to permit(user, customer)
        is_expected.to permit(user, support)
        is_expected.not_to permit(user, admin)
      end
    end

    permissions :update? do
      it { is_expected.not_to permit(user, customer) }
    end

    it 'list all users expect admin' do
      expect(resolved_scope).to contain_exactly(customer, another_customer, support)
    end
  end

  context 'admin' do
    let(:user) { admin }

    permissions :show? do
      it 'can view any users' do
        is_expected.to permit(user, customer)
        is_expected.to permit(user, support)
        is_expected.to permit(user, admin)
      end
    end

    permissions :update? do
      it 'can edit any user' do
        is_expected.to permit(user, support)
        is_expected.to permit(user, admin)
      end
    end

    it 'list all users' do
      expect(resolved_scope).to contain_exactly(customer, another_customer, support, admin)
    end
  end
end
