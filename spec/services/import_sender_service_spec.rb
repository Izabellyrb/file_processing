require "rails_helper"

RSpec.describe ImportSenderService, type: :service do
  describe '.run' do
    let(:valid_import_file) { Nokogiri::XML(File.read('spec/fixtures/valid_invoice.xml')) }

    context "when runs successfully" do
      subject { described_class.new(valid_import_file).run }

      it { expect(subject.name).to eq('Teste Vendas') }
      it { expect(subject.document).to eq('70000070000700') }
      it { expect(subject.errors).to be_empty }
    end

    context "when raise errors" do
      subject { described_class.new(valid_import_file) }

      before { allow(valid_import_file).to receive(:at_xpath).and_raise(StandardError, "Error") }

      it { expect { subject.run }.to raise_error(StandardError, "Error") }
    end
  end
end
