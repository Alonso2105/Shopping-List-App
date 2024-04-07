# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'store_sections/edit', type: :view do
  let(:store_section) do
    StoreSection.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:store_section, store_section)
  end

  it 'renders the edit store_section form' do
    render

    assert_select 'form[action=?][method=?]', store_section_path(store_section), 'post' do
      assert_select 'input[name=?]', 'store_section[name]'
    end
  end
end
