class ChangeDefaultPurchasedToProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :products, :purchased, false
  end
end
