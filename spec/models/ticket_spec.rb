require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:product) { FactoryGirl.build :ticket }
  subject { product }

  it { should respond_to(:title) }
  it { should respond_to(:uid) }
  it { should respond_to(:content) }
  it { should respond_to(:status) }
  it { should respond_to(:user_id) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
  it { should belong_to :user }
end
