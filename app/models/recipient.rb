class Recipient < ApplicationRecord
  validates :document, :name, :address, :address_number,
            :city, :state, :country, :cep, :phone, presence: true
end
