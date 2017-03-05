class CreateDashcampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :dashcampaigns do |t|
      t.references :dash, foreign_key: true
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
