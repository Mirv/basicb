class AddPlayerToCountries < ActiveRecord::Migration[5.0]
  def change
    add_reference :countries, :player, foreign_key: true
  end
end
