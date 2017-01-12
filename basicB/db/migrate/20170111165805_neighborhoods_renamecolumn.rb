class NeighborhoodsRenamecolumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :neighborhoods, :country_id, :target_id
  end
end
