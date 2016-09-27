require 'rails_helper'

describe Api::V1::UsersController do
  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let(:customer) { FactoryGirl.create(:user, role: 'customer') }

  describe '#show' do
    before(:each) do
      @user = FactoryGirl.create :user
      login(admin)
      get :show, id: @user.uid, format: :json
    end

    it 'returns the information about a reporter on a hash' do
      expect(json_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe 'PUT/PATCH #update' do
    it 'can change role' do
      @user = FactoryGirl.create :user, role: 'customer'
      login(admin)
      patch :update, {id: @user.uid, role: 'support' }

      expect(@user.reload.role).to eql 'support'
    end
  end
end