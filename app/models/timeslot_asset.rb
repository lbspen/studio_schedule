class TimeslotAsset < ActiveRecord::Base
  belongs_to :timeslot
  belongs_to :studio_asset
  # attr_accessible :title, :body
end
