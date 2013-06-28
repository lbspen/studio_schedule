class Timeslot < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :timeslot_date, :studio_asset_ids, :notes, :other

  has_many :timeslot_assets
  has_many :studio_assets, through: :timeslot_assets

  validates_date :start_time, :on_or_after => DateTime.now
  validate :check_for_schedule_conflicts

  has_many :timeslot_assets
  has_many :studio_assets, :through => :timeslot_assets

  has_many :timeslot_assets
  has_many :studio_assets, through: :timeslot_assets

  belongs_to :user

  def date_to_s
    start_time.strftime("%B %-d, %Y")
  end

  def start_time_to_s
    start_time.strftime("%l:%M%P")
  end

  def end_time_to_s
    end_time.strftime("%l:%M%P")
  end

  def timeslot_date
    if (start_time != nil)
      date_to_s
    else
      Time.zone.now.strftime("%Y-%m-%e")
    end
  end

  def overlaps?(other)
    (self.start_time.to_i..self.end_time.to_i).overlaps?(other.start_time.to_i..other.end_time.to_i)
  end

  def check_for_schedule_conflicts
    if Timeslot.all.any? do |ts|
        if ts != self
          ts.overlaps? self
        else
          false
        end
      end
      errors[:base] << 'Timeslot conflicts with an existing timeslot'
    end
  end
end
