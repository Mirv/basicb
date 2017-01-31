class DeleteColumnFromCampaigns < ActiveRecord::Migration[5.0]
  def change
    remove_index  :campaigns,  :player_id_id
  end
end
