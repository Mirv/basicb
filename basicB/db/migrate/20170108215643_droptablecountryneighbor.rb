class Droptablecountryneighbor < ActiveRecord::Migration[5.0]
  def change
    drop_table :countryneighbors
  end
end