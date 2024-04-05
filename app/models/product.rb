class Product < ApplicationRecord
  # associations
  belongs_to :store_section, dependent: :destroy

  # validations
  validates :name, presence: true, length: { maximum: 128 }
  validates :purchase_date, presence: true
  validates :store_name, length: { maximum: 64 }
  validates :store_section_id, presence: true
  validates :purchased, inclusion: { in: [true, false] } 
  validates :quantity, presence: true, numericality: { only_integer: true }
end
