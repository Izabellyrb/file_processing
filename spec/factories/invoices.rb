FactoryBot.define do
  factory :invoice do
    serie { "MyString" }
    invoice_number { "MyString" }
    invoice_date { "2024-08-24 16:23:59" }
    sender { nil }
    recipient { nil }
  end
end
