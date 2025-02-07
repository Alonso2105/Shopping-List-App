# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'store_sections/show', type: :view do
  before(:each) do
    assign(:store_section, StoreSection.create!(
                             name: 'Name'
                           ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
