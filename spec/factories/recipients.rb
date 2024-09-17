# frozen_string_literal: true

FactoryBot.define do
  factory :recipient do
    document { "60000050000100" }
    name { "Teste Teste" }
    address { "Rua Teste" }
    address_number { "1" }
    address_complement { "sala 808" }
    city { "São Paulo" }
    state { "SP" }
    country { "Brasil" }
    cep { "07000111" }
    phone { "40028922" }
  end
end
