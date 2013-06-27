class CreateStudioAssets < ActiveRecord::Migration
  def change
    create_table :studio_assets do |t|
      t.string :name
      t.integer :base_cost

      t.timestamps
    end
  end
end
