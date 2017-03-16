class DropUserIDfromDashes < ActiveRecord::Migration[5.0]
  def change
    remove_index  :dashes, :user_id
    remove_column :dashes, :user_id
  end
end

