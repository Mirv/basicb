class ChangePlayerColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :country_id_id, :country_id
  end
end
