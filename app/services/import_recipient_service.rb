# frozen_string_literal: true

class ImportRecipientService < BaseService
  def run
    Recipient.find_or_create_by!(document: import_file.at_xpath("//dest/CNPJ")&.text) do |recipient|
      recipient.name = import_file.at_xpath("//dest/xNome")&.text
      recipient.address = import_file.at_xpath("//enderDest/xLgr")&.text
      recipient.address_number = import_file.at_xpath("//enderDest/nro")&.text
      recipient.address_complement = import_file.at_xpath("//enderDest/xCpl")&.text
      recipient.city = import_file.at_xpath("//enderDest/xMun")&.text
      recipient.state = import_file.at_xpath("//enderDest/UF")&.text
      recipient.country = import_file.at_xpath("//enderDest/xPais")&.text
      recipient.cep = import_file.at_xpath("//enderDest/CEP")&.text
      recipient.phone = import_file.at_xpath("//enderDest/fone")&.text
    end
  rescue StandardError => e
    Rails.configuration.file_process_logger.error("ImportRecipientService Error")
    raise e
  end
end
