class Recipient < ApplicationRecord
  validates :document, :name, :address, :address_number,
            :city, :state, :country, :cep, presence: true
end
