class AddSuppliersRefToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :supplier, foreign_key:
  end
end
