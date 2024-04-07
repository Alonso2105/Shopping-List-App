# frozen_string_literal: true

return if StoreSection.any?

store_sections_names = %w[Meat Dairy Bakery Food Pharmacy Electronics Clothing Home Sports Books Toys Beauty]

store_sections_names.each do |section_name|
  StoreSection.create(name: section_name)
end
