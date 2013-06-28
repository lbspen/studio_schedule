require 'spec_helper'

feature "Deleting timeslot" do
  scenario "Deleting a timeslot" do
    timeslot = Factory(:timeslot)
    value = timeslot.date_to_s
    visit "/"
    click_link "Delete"
    page.should have_content("Timeslot has been deleted.")
    visit "/"
    page.should_not have_content(value)
  end
end