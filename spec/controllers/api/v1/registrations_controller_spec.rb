describe Api::V1::RegistrationsController do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:api_v1_user]
  end

  context '#create' do
    let(:email) { 'test@email.com' }
    let(:password) { '12345678' }

    it 'success' do
      post :create, email: email, password: password

      expect(json).to match_json_schema('users/create')
      user = User.find_by(email: email)
      expect(user).to be_present
      expect(user.email).to eq(email)
      expect(user.valid_password?(password)).to be_truthy
    end

    it 'invalid params' do
      expect do
        post :create, email: 'invalid mail', password: '123'
      end.to raise_error(BadRequestError)
    end
  end
end
