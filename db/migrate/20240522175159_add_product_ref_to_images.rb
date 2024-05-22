class AddProductRefToImages < ActiveRecord::Migration[7.1]
  def change
    add_reference :images, :product, foreign_key: true
  end
end
