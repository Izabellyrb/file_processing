class Invoice < ApplicationRecord
  belongs_to :sender
  belongs_to :recipient
  has_many :products

  validates :serie, :invoice_number, :invoice_date, presence: true
  validates :invoice_number, uniqueness: true

  enum status: { waiting: 0, sent: 2 }
end
