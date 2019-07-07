class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :url
      t.integer :interval
      t.datetime :last_check
      t.timestamps
    end
  end
end
