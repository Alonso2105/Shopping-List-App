# frozen_string_literal: true

json.extract! product, :id, :name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity, :created_at,
              :updated_at
json.url product_url(product, format: :json)
