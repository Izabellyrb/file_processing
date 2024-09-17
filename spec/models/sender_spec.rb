require "rails_helper"

RSpec.describe Sender, type: :model do
  let(:sender) { build(:sender) }

  it "is valid with valid attributes" do
    expect(sender).to be_valid
  end
end
