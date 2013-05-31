require 'spec_helper'

feature "Viewing timeslots" do
  scenario "Listing all timeslots" do
    timeslot = Factory.create(:timeslot)
    visit '/'
    page.should have_content(timeslot.date_to_s)
    page.should have_content(timeslot.start_time_to_s)
    page.should have_content(timeslot.end_time_to_s)
    find_link("Edit")[:href].should == edit_timeslot_path(timeslot)
    find_link("Delete")[:href].should == timeslot_path(timeslot)
    page.find_link("Delete").native["data-method"].should == "delete"
  end
end