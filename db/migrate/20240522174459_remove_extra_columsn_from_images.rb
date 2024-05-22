class RemoveExtraColumsnFromImages < ActiveRecord::Migration[7.1]
  def change
    remove_column :images, :url2
    remove_column :images, :url3
    remove_column :images, :url4
  end
end
