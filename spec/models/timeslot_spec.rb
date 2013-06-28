require 'spec_helper'

feature "Detect overlapping time - " do
  
  scenario "Times do not overlap" do
    ts1 = Timeslot.new({start_time: DateTime.new(2015,1,1,9,0,0), 
      end_time: DateTime.new(2015,1,1,10,0,0)})
    ts2 = Timeslot.new({start_time: DateTime.new(2015,1,1,15,0,0),
      end_time: DateTime.new(2015,1,1,16,0,0)})
    ts1.overlaps?(ts2).should be_false
  end

  scenario "Times do overlap" do
    ts1 = Timeslot.new({start_time: Time.zone.parse("2015-01-01 09:00:00"), 
      end_time: Time.zone.parse("2015-01-01 10:00:00")})
    ts2 = Timeslot.new({start_time: Time.zone.parse("2015-01-01 09:30:00"),
      end_time: Time.zone.parse("2015-01-01 10:00:00")})
    ts1.overlaps?(ts2).should be_true
  end
end

