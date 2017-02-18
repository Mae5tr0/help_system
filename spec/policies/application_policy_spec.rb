RSpec.describe ApplicationPolicy do
  subject { described_class.new(nil, {}) }

  it 'forbidden for anonymous users' do
    expect { subject }.to raise_error(Pundit::NotAuthorizedError)
  end
end