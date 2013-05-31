require 'spec_helper'

feature "Editing Timeslots -" do
  scenario "Updating a timeslot" do
    Factory(:timeslot)
    visit "/"
    click_link "Edit"
    select_date("2014,January,22", :from => "Recording session date") 
    select_time("03 AM", "00", :from => "Start time")
    select_time("04 PM", "45", :from => "End time")
    click_button "Update Timeslot" 
    page.should have_content("Timeslot has been updated.")
    page.should have_content("January 22, 2014")
    page.should have_content("3:00am")
    page.should have_content("4:45pm")
  end
end
  