# frozen_string_literal: true

require "rails_helper"

RSpec.describe Invoice, type: :model do
  let(:invoice) { build(:invoice) }

  it "is valid with valid attributes" do
    expect(invoice).to be_valid
  end

  context "when using scopes" do
    let(:second_invoice) { create(:invoice, created_at: "2024-05-02", status: 2, invoice_number: "27") }

    let(:query) do
      described_class.search_by_created_at("2024-05-01",
                                           "2024-06-01").search_by_status(2).search_by_invoice_number("27")
    end

    it { expect(query).to include(second_invoice) }
    it { expect(query).not_to include(invoice) }
  end

  describe ".statuses_collection" do
    it "returns an array of translated statuses" do
      expect(described_class.statuses_collection).to include(["Em processamento", "waiting"], ["Processado", "sent"])
    end
  end
end
