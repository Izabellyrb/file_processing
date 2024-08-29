# frozen_string_literal: true

class ImportInvoiceService < BaseService
  def initialize(import_file, recipient, sender)
    super(import_file)
    @recipient = recipient
    @sender = sender
  end

  def run
    Invoice.create!(
      serie: import_file.at_xpath("//serie")&.text,
      invoice_number: import_file.at_xpath("//nNF")&.text,
      invoice_date: import_file.at_xpath("//dhEmi")&.text,
      sender_id: @sender.id,
      recipient_id: @recipient.id
    )
  rescue StandardError => e
    Rails.logger.error("ImportProductService Error: #{e.message}")
    raise e
  end
end
