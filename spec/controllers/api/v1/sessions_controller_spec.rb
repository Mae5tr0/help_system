describe Api::V1::SessionsController do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:api_v1_user]
  end

  context '#create' do
    let(:password) { '12345678' }
    let!(:customer) { create(:customer, password: password) }

    it 'return token if correct credentials' do
      post :create, email: customer.email, password: password

      expect(json).to match_json_schema('_access_token')
      expect(json[:token]).to eq(customer.auth_token)
    end

    it 'invalid credentials' do
      expect do
        post :create, email: customer.email, password: 'invalid_password'
      end.to raise_error(UnauthorizedError) do |error|
        expect(error.message_id).to eq(:invalid_credentials)
      end
    end
  end

  context '#destroy' do
    let(:customer) { create(:customer) }

    it 'change auth token' do
      old_token = customer.auth_token
      login(customer)

      delete :destroy

      expect(customer.reload.auth_token).not_to eq(old_token)
    end
  end
end
