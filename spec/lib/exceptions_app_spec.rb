RSpec.describe ExceptionsApp do
  let(:subject) { ExceptionsApp.new('/route') }

  it 'should render exception as json' do
    allow(subject).to receive(:exception).and_return(NotFoundError.new(:not_found))
    expect(subject.body).to match_json_schema('_error')
  end
end
