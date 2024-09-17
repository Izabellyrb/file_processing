# frozen_string_literal: true

FactoryBot.define do
  factory :sender do
    document { "70000070000700" }
    name { "Teste Vendas" }
    address { "Rua das Flores" }
    address_number { "8" }
    address_complement { "sala 27" }
    city { "Rio de Janeiro" }
    state { "RJ" }
    country { "Brasil" }
    cep { "08000222" }
    phone { "40028944" }
  end
end
