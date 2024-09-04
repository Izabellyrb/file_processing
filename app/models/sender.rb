# frozen_string_literal: true

class Sender < ApplicationRecord
  validates :document, :name, :address, :address_number,
            :city, :state, :country, :cep, presence: true
end
