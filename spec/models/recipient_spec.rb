require 'rails_helper'

RSpec.describe Recipient, type: :model do
  let(:recipient) { build(:recipient) }

  it "is valid with valid attributes" do
    expect(recipient).to be_valid
  end
end
