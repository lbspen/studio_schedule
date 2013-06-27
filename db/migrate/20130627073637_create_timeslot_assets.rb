class CreateTimeslotAssets < ActiveRecord::Migration
  def change
    create_table :timeslot_assets do |t|
      t.references :timeslot
      t.references :studio_asset

      t.timestamps
    end
    add_index :timeslot_assets, :timeslot_id
    add_index :timeslot_assets, :studio_asset_id
  end
end
