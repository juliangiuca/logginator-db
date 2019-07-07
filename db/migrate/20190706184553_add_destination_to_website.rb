class AddDestinationToWebsite < ActiveRecord::Migration[5.2]
  def change
    add_column :websites, :destination, :string
  end
end
