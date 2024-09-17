# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    association :sender
    association :recipient

    serie { "2" }
    invoice_number { "10011" }
    invoice_date { "2024-08-24 16:23:59" }
  end
end
