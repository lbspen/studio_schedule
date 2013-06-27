class StudioAsset < ActiveRecord::Base
  attr_accessible :base_cost, :name

  has_many :timeslot_assets
  has_many :timeslots, through: :timeslot_assets

end
