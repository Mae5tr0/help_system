RSpec.describe ApplicationPolicy do
  subject { described_class }

  it 'forbidden for anonymous users' do
    expect do
      described_class.new(nil, {})
    end.to raise_error(Pundit::NotAuthorizedError)
  end

  permissions :index?, :create?, :new?, :update?, :edit?, :destroy? do
    it 'not permit by default' do
      is_expected.not_to permit({}, {})
    end
  end

  it 'show?' do
    expect(described_class.new(create(:admin), create(:ticket)).show?).to be_truthy
  end

  it "don't change scope by default" do
    expect(described_class::Scope.new({}, Ticket).resolve).to eq(Ticket)
  end
end
