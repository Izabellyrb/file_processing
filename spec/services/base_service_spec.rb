require "rails_helper"

RSpec.describe BaseService, type: :service do
  describe '.run' do
    let(:import_file) { double("import_file") }
    let(:recipient) { build(:recipient) }
    let(:sender) { build(:sender) }
    let(:invoice) { build(:invoice) }

    subject { described_class.new(import_file) }

    context "when valid" do
      before do
        allow_any_instance_of(ImportRecipientService).to receive(:run).and_return(recipient)
        allow_any_instance_of(ImportSenderService).to receive(:run).and_return(sender)
        allow_any_instance_of(ImportInvoiceService).to receive(:run).and_return(invoice)
        allow_any_instance_of(ImportProductService).to receive(:run).and_return(true)
      end

      it "runs successfully" do
        expect(subject.run).to be true
        expect(subject.errors).to be_empty
      end
    end

    context "when not valid" do
      before { allow_any_instance_of(ImportRecipientService).to receive(:run).and_raise(StandardError.new('Error')) }

      it "raise errors" do
        expect(subject.run).to be false
        expect(subject.errors).to include('Error')
      end
    end
  end
end
