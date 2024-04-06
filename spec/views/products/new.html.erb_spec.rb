require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      store_name: "MyString",
      store_section: nil,
      purchased: false,
      quantity: 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[store_name]"

      assert_select "input[name=?]", "product[store_section_name]"

      assert_select "input[name=?]", "product[quantity]"
    end
  end
end
