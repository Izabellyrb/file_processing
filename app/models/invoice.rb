class Invoice < ApplicationRecord
  belongs_to :sender
  belongs_to :recipient
  validates :name, :serie, :invoice_number, :invoice_date, presence: true
  validates_associated :sender, :recipient

  enum status: { waiting: 0, sent: 2 }
end
