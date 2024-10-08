# frozen_string_literal: true

class BaseService
  attr_reader :import_file, :errors

  def initialize(import_file)
    @import_file = import_file
    @errors = []
  end

  def run
    recipient = ImportRecipientService.new(import_file).run
    sender = ImportSenderService.new(import_file).run
    invoice = ImportInvoiceService.new(import_file, recipient, sender).run

    ImportProductService.new(import_file, invoice).run
  rescue StandardError => e
    @errors << e.message
    false
  end
end
