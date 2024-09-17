# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :invoice

    name { "camiseta" }
    ncm { "13023000" }
    cfop { "3303" }
    unit_com { "2" }
    quantity_com { "2.00" }
    total_amount { "199.99" }
    icms {"12.00"}
    ipi {"1.75"}
    pis {"0.00"}
    cofins {"0.00"}
  end
end
