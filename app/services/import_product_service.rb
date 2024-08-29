# frozen_string_literal: true

class ImportProductService < BaseService
  def initialize(import_file, invoice)
    super(import_file)
    @invoice = invoice
  end

  def run
    import_file.xpath("//det").each do |product_item|
      Product.create!(
        name: product_item.at_xpath("prod/xProd")&.text,
        ncm: product_item.at_xpath("prod/NCM")&.text,
        cfop: product_item.at_xpath("prod/CFOP")&.text,
        unit_com: product_item.at_xpath("prod/uCom")&.text,
        quantity_com: product_item.at_xpath("prod/qCom")&.text,
        total_amount: product_item.at_xpath("prod/vUnCom")&.text,
        icms: product_item.at_xpath("imposto//vICMS")&.text || 0.00,
        ipi: product_item.at_xpath("imposto//vIPI")&.text || 0.00,
        pis: product_item.at_xpath("imposto//vPIS")&.text || 0.00,
        cofins: product_item.at_xpath("imposto//vCOFINS")&.text || 0.00,
        invoice_id: @invoice.id
      )
    end
  rescue StandardError => e
    Rails.logger.error("ImportProductService Error: #{e.message}")
    raise e
  end
end
