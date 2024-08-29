# frozen_string_literal: true

class ImportSenderService < BaseService
  def run
    Sender.find_or_create_by!(document: import_file.at_xpath("//emit/CNPJ")&.text) do |sender|
      sender.name = import_file.at_xpath("//xNome")&.text
      sender.address = import_file.at_xpath("//enderEmit/xLgr")&.text
      sender.address_number = import_file.at_xpath("//enderEmit/nro")&.text
      sender.address_complement = import_file.at_xpath("//enderEmit/xCpl")&.text
      sender.city = import_file.at_xpath("//enderEmit/xMun")&.text
      sender.state = import_file.at_xpath("//enderEmit/UF")&.text
      sender.country = import_file.at_xpath("//enderEmit/xPais")&.text
      sender.cep = import_file.at_xpath("//enderEmit/CEP")&.text
      sender.phone = import_file.at_xpath("//enderEmit/fone")&.text
    end
  rescue StandardError => e
    Rails.logger.error("ImportSenderService Error: #{e.message}")
    raise e
  end
end
