require 'rails_helper'

RSpec.shared_examples 'with_uid' do
  def model_name
    described_class.name.to_s.downcase
  end

  it { is_expected.to validate_uniqueness_of :uid }

  context '#generate_uid' do
    it 'generates a unique uid' do
      subject.generate_uid
      expect(subject.uid).to eq("#{model_name}_uid")
    end

    it 'generates another uid when one already has been taken' do
      create(model_name, uid: "#{model_name}_uid")
      allow(SecureRandom).to receive(:uuid).and_return(:uid, :uid_2)

      model = build(model_name)
      model.generate_uid

      expect(model.uid).to eq("#{model_name}_uid_2")
    end

    it "don't override existed uid" do
      model = create(model_name, uid: "#{model_name}_uid")
      model.generate_uid

      expect(model.uid).to eq("#{model_name}_uid")
    end
  end
end
