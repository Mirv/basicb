class RenamecolumnsonUserdash < ActiveRecord::Migration[5.0]
  def change
    remove_index  :userdashes, :Dash_id
    remove_index  :userdashes, :User_id
    rename_column :userdashes, :User_id, :user_id
    rename_column :userdashes, :Dash_id, :dash_id
  end
end
