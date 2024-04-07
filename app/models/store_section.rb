# frozen_string_literal: true

class StoreSection < ApplicationRecord
  # associations
  has_many :products

  # validations
  validates :name, presence: true, length: { maximum: 64 }
end
