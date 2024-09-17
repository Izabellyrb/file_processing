class Invoice < ApplicationRecord
  belongs_to :sender
  belongs_to :recipient
  has_many :products

  validates :serie, :invoice_number, :invoice_date, presence: true

  enum status: { waiting: 0, sent: 2 }

  scope :search_by_invoice_number, ->(invoice_number) { where(invoice_number: invoice_number.strip) }
  scope :search_by_status, ->(invoice_status) { where(status: invoice_status) }
  scope :search_by_created_at, lambda { |start_date, end_date|
    where(created_at: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day)
  }

  paginates_per 15

  def self.statuses_collection
    statuses.keys.map { |key| [I18n.t("invoices.status.#{key}"), key] }
  end
end
