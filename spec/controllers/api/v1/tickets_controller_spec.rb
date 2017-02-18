describe Api::V1::TicketsController do
  let(:admin) { create(:user, role: 'admin') }
  let(:customer) { create(:user, role: 'customer') }

  context '#index' do
    it 'admin can view all tickets' do
      4.times { create :ticket }
      login(admin)
      get :index

      expect(json_response.count).to eq(4)
    end

    it 'customer can view only his tickets' do
      2.times { create(:ticket, user: customer) }
      2.times { create :ticket }

      login(customer)
      get :index

      expect(json_response.count).to eq(2)
    end
  end

  context '#show' do
    before(:each) do
      @ticket = create :ticket
      login(admin)
      get :show, id: @ticket.uid
    end

    it 'returns the information about a reporter on a hash' do
      expect(json_response[:title]).to eql @ticket.title
    end
  end

  context '#create' do
    context 'when is successfully created' do
      before(:each) do
        @ticket_attributes = attributes_for :ticket
        login(customer)
        post :create, @ticket_attributes
      end

      it do
        expect(response).to have_http_status(:no_content)
        expect(Ticket.count).to eq(1)
      end
    end

    context 'when is not created' do
      it 'renders the json errors on whye the ticket could not be created' do
        login(customer)
        @invalid_ticket_attributes = { title: 'Smart TV', content: '' }
        expect do
          post :create, @invalid_ticket_attributes
        end.to raise_error(BadRequestError)
      end
    end
  end

  context '#update' do
    before(:each) do
      @user = create :user
      @ticket = create :ticket, user: @user, status: 'open', title: 'title'
      login(admin)
    end

    it 'can only close ticket' do
      patch :update, id: @ticket.uid, status: 'closed', title: 'mega'

      should respond_with :no_content
      expect(@ticket.reload.status).to eq('closed')
      expect(@ticket.reload.title).to eq('title')
    end
  end

  describe '#destroy' do
    before(:each) do
      @user = create :user
      @ticket = create :ticket, user: @user
      login(admin)
      delete :destroy, id: @ticket.uid
    end

    it { should respond_with :no_content }
  end
end
