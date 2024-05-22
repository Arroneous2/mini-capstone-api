class ChangeNameUrl1FromImages < ActiveRecord::Migration[7.1]
  def change
    rename_column :images, :url1, :url
  end
end
