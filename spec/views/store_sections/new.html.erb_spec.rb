# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'store_sections/new', type: :view do
  before(:each) do
    assign(:store_section, StoreSection.new(
                             name: 'MyString'
                           ))
  end

  it 'renders new store_section form' do
    render

    assert_select 'form[action=?][method=?]', store_sections_path, 'post' do
      assert_select 'input[name=?]', 'store_section[name]'
    end
  end
end
