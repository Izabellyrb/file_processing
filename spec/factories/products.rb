FactoryBot.define do
  factory :product do
    name { "MyString" }
    ncm { "MyString" }
    cfop { "MyString" }
    unit_com { "MyString" }
    quantity_com { "9.99" }
    amount { "9.99" }
    invoice { nil }
  end
end
