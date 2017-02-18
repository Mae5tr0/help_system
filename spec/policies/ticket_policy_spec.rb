RSpec.describe TicketPolicy do
  let(:customer) { create(:customer) }
  let(:admin) { create(:admin) }
  let(:support) { create(:support) }
  let!(:ticket) { create(:ticket, user: customer) }
  let!(:closed_ticket) { create(:ticket, user: customer, status: :closed) }
  let!(:another_ticket) { create(:ticket, user: create(:customer)) }

  subject { described_class }
  let(:resolved_scope) { described_class::Scope.new(user, Ticket.all).resolve }

  context 'customer' do
    let(:user) { customer }

    permissions :create? do
      it { is_expected.to permit(user) }
    end

    permissions :show? do
      it 'customer can view only their tickets' do
        is_expected.to permit(user, ticket)
        is_expected.not_to permit(user, another_ticket)
      end
    end

    permissions :delete? do
      it { is_expected.not_to permit(user, ticket) }
    end

    permissions :update? do
      it 'can not edit closed ticket' do
        is_expected.not_to permit(user, closed_ticket)
      end

      it 'can edit only their ticket' do
        is_expected.to permit(user, ticket)
        is_expected.not_to permit(user, another_ticket)
      end
    end

    it 'list only their tickets' do
      expect(resolved_scope).to contain_exactly(ticket, closed_ticket)
    end
  end

  context 'support' do
    let(:user) { support }

    permissions :create? do
      it { is_expected.to permit(user) }
    end

    permissions :show? do
      it 'can view any ticket' do
        is_expected.to permit(user, ticket)
        is_expected.to permit(user, another_ticket)
      end
    end

    permissions :delete? do
      it { is_expected.not_to permit(user, ticket) }
    end

    permissions :update? do
      it 'can not edit closed ticket' do
        is_expected.not_to permit(user, closed_ticket)
      end

      it 'can edit any ticket' do
        is_expected.to permit(user, ticket)
        is_expected.to permit(user, another_ticket)
      end
    end

    it 'list all tickets' do
      expect(resolved_scope).to contain_exactly(ticket, closed_ticket, another_ticket)
    end
  end

  context 'admin' do
    let(:user) { admin }

    permissions :create? do
      it { is_expected.to permit(user) }
    end

    permissions :show? do
      it 'can view any tickets' do
        is_expected.to permit(user, ticket)
        is_expected.to permit(user, another_ticket)
      end
    end

    permissions :delete? do
      it { is_expected.to permit(user, ticket) }
    end

    permissions :update? do
      it 'can edit any ticket' do
        is_expected.to permit(user, closed_ticket)
        is_expected.to permit(user, another_ticket)
      end
    end

    it 'list all tickets' do
      expect(resolved_scope).to contain_exactly(ticket, closed_ticket, another_ticket)
    end
  end
end
