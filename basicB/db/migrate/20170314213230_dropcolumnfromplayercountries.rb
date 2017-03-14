class Dropcolumnfromplayercountries < ActiveRecord::Migration[5.0]
  def change
    rename_column :Playercountries, :Country_id, :country_id
    rename_column :Playercountries, :Player_id, :player_id
  end
end
