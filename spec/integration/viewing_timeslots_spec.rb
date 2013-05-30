require 'spec_helper'

feature "Viewing timeslots" do
  scenario "Listing all timeslots" do
    timeslot = Factory.create(:timeslot)
    visit '/'
    page.should have_content(timeslot.date_to_s)
    page.should have_content(timeslot.start_time_to_s)
    page.should have_content(timeslot.end_time_to_s)
  end
end