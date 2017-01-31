class DeleteColumnFromCampaigns2 < ActiveRecord::Migration[5.0]
  def change
    remove_column  :campaigns,  :player_id_id
  end
end
