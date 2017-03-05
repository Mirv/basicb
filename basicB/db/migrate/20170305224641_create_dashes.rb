class CreateDashes < ActiveRecord::Migration[5.0]
  def change
    create_table :dashes do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :dashcampaigns, foreign_key: true
      t.references :dashplayers, foreign_key: true

      t.timestamps
    end
  end
end
