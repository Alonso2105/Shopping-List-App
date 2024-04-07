# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, limit: 128
      t.date :purchase_date
      t.string :store_name, limit: 64
      t.references :store_section, null: false, foreign_key: true
      t.boolean :purchased
      t.integer :quantity

      t.timestamps
    end
  end
end
