class Timeslot < ActiveRecord::Base
  attr_accessible :end_time, :recording_session_date, :start_time

  validates_date :recording_session_date, :on_or_after => DateTime.now
  
  def date_to_s
    recording_session_date.strftime("%B %-d, %Y")
  end

  def start_time_to_s
    start_time.strftime("%l:%M%P")
  end

  def end_time_to_s
    end_time.strftime("%l:%M%P")
  end
end
