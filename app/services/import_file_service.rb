# frozen_string_literal: true

class ImportFileService
  def initialize(import_file)
    @import_file = import_file
  end

  def run
    import_sender
    import_recipient
    import_invoice
  rescue StandardError => e
    Rails.logger.error("ImportFileService Error: #{e.message}") if Rails.env.production?
    false
  end

  def import_invoice
    invoice = Invoice.new(
      serie: @import_file.at_xpath("//serie")&.text,
      invoice_number: @import_file.at_xpath("//nNF")&.text,
      invoice_date: @import_file.at_xpath("//dhEmi")&.text,
      sender_id: Sender.find_by(id: @sender.id)&.id,
      recipient_id: Recipient.find_by(id: @recipient.id)&.id
    )
    invoice.save!
  end

  def import_sender
    @sender = Sender.find_or_initialize_by(document: @import_file.at_xpath("//emit/CNPJ")&.text)
    @sender.update(
      name: @import_file.at_xpath("//xNome")&.text,
      address: @import_file.at_xpath("//enderEmit/xLgr")&.text,
      address_number: @import_file.at_xpath("//enderEmit/nro")&.text,
      city: @import_file.at_xpath("//enderEmit/xMun")&.text,
      state: @import_file.at_xpath("//enderEmit/UF")&.text,
      country: @import_file.at_xpath("//enderEmit/xPais")&.text,
      cep: @import_file.at_xpath("//enderEmit/CEP")&.text,
      phone: @import_file.at_xpath("//enderEmit/fone")&.text
    )
  end

  def import_recipient
    @recipient = Recipient.find_or_initialize_by(document: @import_file.at_xpath("//dest/CNPJ")&.text)
    @recipient.update(
      name: @import_file.at_xpath("//xNome")&.text,
      address: @import_file.at_xpath("//enderDest/xLgr")&.text,
      address_number: @import_file.at_xpath("//enderDest/nro")&.text,
      city: @import_file.at_xpath("//enderDest/xMun")&.text,
      state: @import_file.at_xpath("//enderDest/UF")&.text,
      country: @import_file.at_xpath("//enderDest/xPais")&.text,
      cep: @import_file.at_xpath("//enderDest/CEP")&.text,
      phone: @import_file.at_xpath("//enderDest/fone")&.text
    )
  end
end
