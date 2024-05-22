class AddSuplierIdToProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :suppliers_id, :supplier_id

  end
end
