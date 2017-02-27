class RemovePlayerFromCountry < ActiveRecord::Migration[5.0]
  def change
    remove_column :Countries, :player
  end
end
