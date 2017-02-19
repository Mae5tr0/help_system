describe Api::V1::TicketsController do
  let(:admin) { create(:admin) }
  let(:support) { create(:support) }
  let(:customer) { create(:customer) }
  let(:another_customer) { create(:customer) }

  context '#index' do
    it 'format' do
      create_list(:ticket, 2)
      login(admin)

      get :index

      expect(json).to match_json_schema('tickets/index')
    end

    it 'admin can view all tickets' do
      tickets = create_list(:ticket, 2)
      login(admin)
      get :index

      expect(assigns(:tickets)).to contain_exactly(*tickets)
    end

    it 'support can view all tickets' do
      tickets = create_list(:ticket, 2)
      login(support)
      get :index

      expect(assigns(:tickets)).to contain_exactly(*tickets)
    end

    it 'customer can view only his tickets' do
      customer_tickets = create_list(:ticket, 2, user: customer)
      create_list(:ticket, 2, user: another_customer)

      login(customer)
      get :index

      expect(assigns(:tickets)).to contain_exactly(*customer_tickets)
    end
  end

  context '#show' do
    let(:ticket) { create(:ticket, user: customer) }

    it 'format' do
      login(customer)

      get :show, id: ticket.uid

      expect(json).to match_json_schema('tickets/show')
    end

    it 'error when try receive another customer ticket' do
      login(customer)
      another_customer_ticket = create(:ticket, user: another_customer)

      expect do
        get :show, id: another_customer_ticket.uid
      end.to raise_error(UnauthorizedError)
    end

    it 'not found error' do
      login(customer)

      expect do
        get :show, id: 'invalid id'
      end.to raise_error(NotFoundError)
    end
  end

  context '#create' do
    before do
      login(customer)
    end

    let(:ticket_attributes) {
      {
        title: 'Title',
        content: 'Content'
      }
    }

    it 'success' do
      post :create, ticket_attributes

      expect(response).to have_http_status(:no_content)

      ticket = Ticket.first
      expect(ticket.title).to eq('Title')
      expect(ticket.content).to eq('Content')
      expect(ticket.user).to eq(customer)
      expect(ticket.opened?).to be_truthy
    end

    it 'success' do
      expect do
        post :create, ticket_attributes.merge(title: nil, content: nil)
      end.to raise_error(BadRequestError) { |error|
        # TODO new validation error format
        # expect(error.message_id).to be == :customer_not_confirmed
      }
    end
  end

  context '#update' do
    let!(:opened_ticket) { create(:opened_ticket, user: customer) }
    let!(:another_customer_ticket) { create(:opened_ticket, user: another_customer) }
    let!(:closed_ticket) { create(:closed_ticket, user: customer) }

    it 'customer can update his opened ticket' do
      login(customer)
      post :update, id: opened_ticket.uid, content: 'New content'

      expect(response).to have_http_status(:no_content)

      opened_ticket.reload
      expect(opened_ticket.content).to eq('New content')
    end

    it "customer can't update another customer ticket" do
      login(customer)

      expect do
        post :update, id: another_customer_ticket.uid, content: 'New content'
      end.to raise_error(UnauthorizedError)
    end

    it "customer can't update closed ticket" do
      login(customer)

      expect do
        post :update, id: closed_ticket.uid, content: 'New content'
      end.to raise_error(UnauthorizedError)
    end

    it 'support can change ticket state' do
      login(support)

      post :update, id: opened_ticket.uid, status: 'closed'

      expect(opened_ticket.reload.closed?).to be_truthy
    end
  end

  describe '#destroy' do
    let!(:ticket) { create(:ticket, user: customer) }

    it 'admin can delete ticket' do
      login(admin)

      delete :destroy, id: ticket.uid

      expect(response).to have_http_status(:no_content)
      expect(Ticket.exists?(uid: ticket.uid)).to be_falsey
    end

    it "support can't delete tickets" do
      login(support)

      expect do
        delete :destroy, id: ticket.uid
      end.to raise_error(UnauthorizedError)
    end
  end

  describe '#search' do
    let!(:ticket_1) { create(:ticket, title: 'Title 1', user: customer) }
    let!(:ticket_2) { create(:ticket, title: 'Title 2', user: customer) }
    let!(:ticket_3) { create(:ticket, title: 'Title 3', user: another_customer) }

    it 'customer search through his tickets' do
      login(customer)

      post :search, query: 'title'
      expect(assigns(:tickets)).to contain_exactly(ticket_1, ticket_2)
    end

    it 'support search through all tickets' do
      login(support)

      post :search, query: 'title'
      expect(assigns(:tickets)).to contain_exactly(ticket_1, ticket_2, ticket_3)
    end
  end
end
