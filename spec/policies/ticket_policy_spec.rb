require 'rails_helper'

# split tests by role
RSpec.describe TicketPolicy do
  let(:customer) { create(:customer) }
  let(:admin) { create(:admin) }
  let(:support) { create(:support) }
  let(:ticket) { build(:ticket, user: customer) }
  let(:closed_ticket) { build(:ticket, user: customer, status: :closed) }
  let(:another_ticket) { build(:ticket, user: create(:customer)) }

  subject { described_class }

  permissions :create? do
    it 'anyone can create ticket' do
      is_expected.to permit(admin)
      is_expected.to permit(support)
      is_expected.to permit(customer)
    end
  end

  permissions :show? do
    it 'allow access for admin and support to any ticket' do
      is_expected.to permit(admin, ticket)
      is_expected.to permit(support, ticket)
    end

    it 'customer can view only their tickets' do
      is_expected.to permit(customer, ticket)
      is_expected.not_to permit(customer, another_ticket)
    end
  end

  permissions :delete? do
    it 'only admin user can delete tickets' do
      is_expected.to permit(admin, ticket)
      is_expected.not_to permit(support, ticket)
      is_expected.not_to permit(customer, ticket)
    end
  end

  permissions :update? do
    it 'closed ticket can edit only admin' do
      is_expected.to permit(admin, closed_ticket)
      is_expected.not_to permit(support, closed_ticket)
      is_expected.not_to permit(customer, closed_ticket)
    end

    it 'customer can edit only their ticket' do
      is_expected.to permit(customer, ticket)
      is_expected.not_to permit(customer, closed_ticket)
      is_expected.not_to permit(customer, another_ticket)
    end

    it 'support can edit only open tickets' do
      is_expected.not_to permit(support, closed_ticket)
      is_expected.to permit(support, ticket)
    end
  end
end