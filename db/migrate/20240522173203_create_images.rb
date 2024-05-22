class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :url1
      t.string :url2
      t.string :url3
      t.string :url4

      t.timestamps
    end
  end
end
