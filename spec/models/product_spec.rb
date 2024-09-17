# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  it "is valid with valid attributes" do
    expect(product).to be_valid
  end
end
