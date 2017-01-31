class AddCompositeIndexToCampcount < ActiveRecord::Migration[5.0]
  def change
    add_index(:campcounts, [:campaign_id, :country_id],:unique => true)
  end
end
