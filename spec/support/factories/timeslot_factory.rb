FactoryGirl.define do 
  factory :timeslot do
    start_time Time.local(2013, 12, 7, 9, 0, 0)
    end_time Time.local(2013, 12, 7, 11, 30, 0)
  end
end