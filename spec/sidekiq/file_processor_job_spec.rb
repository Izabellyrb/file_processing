require "rails_helper"

RSpec.describe FileProcessorJob, type: :job do
  let(:xml_file) { "<root><tag>conteudo_xml</tag></root>" }

  before { allow(BaseService).to receive(:new).and_return(service_instance) }

  describe ".perform" do
    context "when xml file is processed" do
      let(:service_instance) { double('BaseService', run: true, errors: []) }

      before { allow(Rails.configuration.file_process_logger).to receive(:info) }

      it "logs a success message" do
        described_class.new.perform(xml_file)

        expect(Rails.configuration.file_process_logger).to have_received(:info).with("Arquivo processado com sucesso.")
      end
    end

    context "when xml file is not processed" do
      let(:service_instance) { double('BaseService', run: false, errors: ["Erro 1", "Erro 2", "Erro 3"]) }

      before { allow(Rails.configuration.file_process_logger).to receive(:error) }

      it "logs an error message" do
        described_class.new.perform(xml_file)

        expect(Rails.configuration.file_process_logger).to have_received(:error).with(
          "Falha ao processar o arquivo. Erro 1 | Erro 2 | Erro 3"
        )
      end
    end
  end
end
