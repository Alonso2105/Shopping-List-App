# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/store_sections', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # StoreSection. As you add validations to StoreSection, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) do
    {
      name: 'Seccion de Tienda 1'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      StoreSection.create! valid_attributes
      get store_sections_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      store_section = StoreSection.create! valid_attributes
      get store_section_url(store_section)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_store_section_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      store_section = StoreSection.create! valid_attributes
      get edit_store_section_url(store_section)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new StoreSection' do
        expect do
          post store_sections_url, params: { store_section: valid_attributes }
        end.to change(StoreSection, :count).by(1)
      end

      it 'redirects to the created store_section' do
        post store_sections_url, params: { store_section: valid_attributes }
        expect(response).to redirect_to(store_section_url(StoreSection.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new StoreSection' do
        expect do
          post store_sections_url, params: { store_section: invalid_attributes }
        end.to change(StoreSection, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post store_sections_url, params: { store_section: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
