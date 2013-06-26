class CreateStudioAssets < ActiveRecord::Migration
  def change
    create_table :studio_assets do |t|
      t.integer :studio_hours
      t.boolean :piano
      t.boolean :tune_piano
      t.boolean :credit_card
      t.boolean :tracking
      t.boolean :overdubs
      t.boolean :editing
      t.boolean :mixing
      t.boolean :mastering
      t.boolean :production
      t.boolean :post_production
      t.boolean :other
      t.text :other_text
      t.text :notes
      t.text :instrumentation
      t.integer :total, :default => 0

      t.timestamps
    end
  end
end
