require 'spec_helper'

feature "Editing Timeslots -" do
  let!(:timeslot) { Factory.create(:timeslot) }

  before do
    visit "/"
    click_link "Edit"
  end

  scenario "Updating a timeslot" do
    fill_in("datepicker", :with => "2014-09-09")
    fill_in("Start time", :with => "3:00pm")
    fill_in("End time", :with => "4:45pm")
    click_button "Update Timeslot" 
    page.should have_content("Timeslot has been updated.")
    page.should have_content("September 9, 2014")
    page.should have_content("3:00pm")
    page.should have_content("4:45pm")
  end

  scenario "Updating an invalid timeslot" do
    fill_in("datepicker", :with => "2013-03-09")
    click_button "Update Timeslot"
    page.should have_content("Timeslot was not updated.")
  end
end
  