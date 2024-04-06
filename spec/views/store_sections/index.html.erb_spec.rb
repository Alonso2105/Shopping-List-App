require 'rails_helper'

RSpec.describe "store_sections/index", type: :view do
  before(:each) do
    assign(:store_sections, [
      StoreSection.create!(
        name: "Name"
      ),
      StoreSection.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of store_sections" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
