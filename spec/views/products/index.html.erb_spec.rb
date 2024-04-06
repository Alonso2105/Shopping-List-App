require 'rails_helper'

RSpec.describe "products/index", type: :view do
  let!(:store_section) { StoreSection.create(name: "Store Name") }

  before(:each) do
    Product.all.delete_all
    assign(:grouped_products, { Date.today =>[
      Product.create!(
        name: "Name",
        store_name: "Store Name",
        store_section: store_section,
        purchased: false,
        quantity: 2,
        purchase_date: Date.today
      ),
      Product.create!(
        name: "Name",
        store_name: "Store Name",
        store_section: store_section,
        purchased: false,
        quantity: 2,
        purchase_date: Date.today
      )
    ]})
  end

  it "renders a list of products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>table>tbody>tr>td' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 6
    assert_select cell_selector, text: Regexp.new("Store Name".to_s), count: 4
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 10
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
