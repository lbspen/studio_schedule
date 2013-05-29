class Timeslot < ActiveRecord::Base
  attr_accessible :end_time, :recording_session_date, :start_time
end
