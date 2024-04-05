require 'rails_helper'

RSpec.describe StoreSection, type: :model do
  describe "associations" do
    it { is_expected.to(have_many(:products)) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      store_section = StoreSection.new(name: "Section A")
      expect(store_section).to be_valid
    end

    it "is not valid without a name" do
      store_section = StoreSection.new(name: nil)
      expect(store_section).not_to be_valid
    end

    it "is not valid with a name longer than 64 characters" do
      store_section = StoreSection.new(name: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
      expect(store_section).not_to be_valid
    end
  end
end