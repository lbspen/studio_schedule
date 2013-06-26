class StudioAssetSerializer < ActiveModel::Serializer
  attributes :id, :studio_hours, :piano, :tune_piano, :credit_card, :tracking, :overdubs, :editing, :mixing, :mastering, :production, :post_production, :other, :other_text, :notes, :instrumentation
end
