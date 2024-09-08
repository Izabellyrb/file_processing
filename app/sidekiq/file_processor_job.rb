# frozen_string_literal: true

class FileProcessorJob
  include Sidekiq::Worker

  def perform(xml_file)
    xml_data = Nokogiri::XML(xml_file)
    xml_data.remove_namespaces!

    file_process = BaseService.new(xml_data)

    if file_process.run
      Rails.configuration.file_process_logger.info("Arquivo processado com sucesso.")
    else
      Rails.configuration.file_process_logger.error("Falha ao processar o arquivo. #{
        file_process.errors.map(&:to_s).join(' | ')
      }")
    end
  end
end
