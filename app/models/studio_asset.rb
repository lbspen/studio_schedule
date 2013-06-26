class StudioAsset < ActiveRecord::Base
  attr_accessible :credit_card, :editing, :instrumentation, :mastering, :mixing, :notes, :other, :other_text, :overdubs, :piano, :post_production, :production, :studio_hours, :tracking, :tune_piano
end
