class Timeslot < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :timeslot_date, :studio_asset_ids, :notes, :other

  has_many :timeslot_assets
  has_many :studio_assets, through: :timeslot_assets

  validates_date :start_time, :on_or_after => DateTime.now

  def date_to_s
    start_time.strftime("%B %-d, %Y")
  end

  def start_time_to_s
    start_time.strftime("%l:%M%P")
  end

  def end_time_to_s
    end_time.strftime("%l:%M%P")
  end

end
