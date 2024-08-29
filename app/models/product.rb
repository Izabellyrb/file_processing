class Product < ApplicationRecord
  belongs_to :invoice
  validates :name, :ncm, :cfop, :unit_com, :quantity_com, :total_amount, presence: true
end
