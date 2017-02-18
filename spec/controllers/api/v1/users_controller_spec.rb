describe Api::V1::UsersController do
  let!(:admin) { create(:admin) }
  let!(:support) { create(:support) }
  let!(:customer) { create(:customer) }
  let!(:another_customer) { create(:customer) }

  describe '#index' do
    it 'format' do
      login(admin)

      get :index

      expect(json).to match_json_schema('users/index')
    end

    it 'admin see all users' do
      login(admin)

      get :index

      expect(assigns(:users)).to contain_exactly(admin, support, customer, another_customer)
    end

    it 'support should not see admin' do
      login(support)

      get :index

      expect(assigns(:users)).to contain_exactly(support, customer, another_customer)
    end

    it 'customer can see only himself' do
      login(customer)

      get :index

      expect(assigns(:users)).to contain_exactly(customer)
    end
  end

  describe '#show' do
    it 'format' do
      login(customer)

      get :show, id: customer.uid

      expect(json).to match_json_schema('users/show')
    end

    it "customer can't see another customer" do
      login(customer)

      expect do
        get :show, id: another_customer.uid
      end.to raise_error(UnauthorizedError)
    end

    it "support can't see admin" do
      login(customer)

      expect do
        get :show, id: admin.uid
      end.to raise_error(UnauthorizedError)
    end

    it 'not found error' do
      login(admin)

      expect do
        get :show, id: 'invalid id'
      end.to raise_error(NotFoundError)
    end
  end

  describe '#update' do
    it 'change role' do
      login(admin)
      patch :update, {id: customer.uid, role: User::Role::SUPPORT }

      expect(customer.reload.support?).to be_truthy
    end

    it 'invalid role' do
      login(admin)
      expect do
        patch :update, {id: customer.uid, role: 'invalid' }
      end.to raise_error(BadRequestError)
    end

    it 'forbidden to change' do
      login(support)
      expect do
        patch :update, {id: support.uid, role: User::Role::ADMIN }
      end.to raise_error(UnauthorizedError)
    end

    it 'not found error' do
      login(admin)

      expect do
        patch :update, {id: 'invalid id', role: User::Role::ADMIN }
      end.to raise_error(NotFoundError)
    end
  end
end