require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it { is_expected.to(belong_to(:store_section).dependent(:destroy)) }
  end

  describe "validations" do
    let!(:store_section) { StoreSection.create(name: "Sección de Tienda 1") }

    it "is valid with valid attributes" do
      product = Product.new(
        name: "Producto A",
        purchase_date: Date.today,
        store_section_id: store_section.id,
        purchased: true,
        quantity: 10
      )
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product = Product.new(
        name: nil,
        purchase_date: Date.today,
        store_section_id: store_section.id,
        purchased: true,
        quantity: 10
      )
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is not valid with a name longer than 128 characters" do
      long_name = "A" * 129  # Genera un nombre con más de 128 caracteres
      product = Product.new(
        name: long_name,
        purchase_date: Date.today,
        store_section_id: store_section.id,
        purchased: true,
        quantity: 10
      )
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("is too long (maximum is 128 characters)")
    end

    it "is not valid without a purchase date" do
      product = Product.new(
        name: "Product A",
        purchase_date: nil,
        store_section_id: store_section.id,
        purchased: true,
        quantity: 10
      )
      expect(product).not_to be_valid
      expect(product.errors[:purchase_date]).to include("can't be blank")
    end

    it "is not valid without a store section id" do
      product = Product.new(
        name: "Product A",
        purchase_date: Date.today,
        store_section_id: nil,
        purchased: true,
        quantity: 10
      )
      expect(product).not_to be_valid
      expect(product.errors[:store_section_id]).to include("can't be blank")
    end

    it "is not valid with a non-integer quantity" do
      product = Product.new(
        name: "Product A",
        purchase_date: Date.today,
        store_section_id: store_section.id,
        purchased: true,
        quantity: "abc"
      )
      expect(product).not_to be_valid
      expect(product.errors[:quantity]).to include("is not a number")
    end

    describe "#purchased?" do
        it 'returns true if the product is purchased' do
          product = Product.new(purchased: true)
          expect(product.purchased?).to eq(true)
        end

        it 'returns false if the product is not purchased' do
          product = Product.new(purchased: false)
          expect(product.purchased?).to eq(false)
        end
      end

      it "allows assigning true or false to purchased" do
        product_true = Product.new(purchased: true)
        product_false = Product.new(purchased: false)

        expect(product_true.purchased).to eq(true)
        expect(product_false.purchased).to eq(false)
      end
  end
end