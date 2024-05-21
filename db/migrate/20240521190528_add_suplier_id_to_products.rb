class AddSuplierIdToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :suppliers, foreign_key: true
  end
end
