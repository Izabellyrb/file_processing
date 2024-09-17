require "rails_helper"

RSpec.describe FileProcess::ProductHelper, type: :helper do
  describe ".total_items" do
    let(:products) { [build(:product)] }

    it { expect(helper.total_items(products, :quantity_com)).to eq 2.00 }
    it { expect(helper.total_items(products, :total_amount)).to eq 199.99}
    it { expect(helper.total_items(products, :icms)).to eq 12.00 }
    it { expect(helper.total_items(products, :ipi)).to eq 1.75 }
    it { expect(helper.total_items(products, :pis)).to eq 0.00 }
    it { expect(helper.total_items(products, :cofins)).to eq 0.00 }
  end
end
