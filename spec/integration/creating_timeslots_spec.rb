require 'spec_helper'

feature 'Creating Timeslots -' do

  before do
    visit "/" 
    click_link "New Timeslot"
  end
   
  scenario 'Can create a Timeslot' do
    fill_in("datepicker", :with => "2013-12-07")
    fill_in("Start time", :with => "2:00pm")
    fill_in("End time", :with => "4:30pm")
    click_button "Create Timeslot" 
    page.should have_content("Timeslot has been created")
    page.should have_content("December 7, 2013")
    page.should have_content("2:00pm")
    page.should have_content("4:30pm")
    page.find_link("Back")[:href].should == root_path
  end

  scenario "can not create a timeslot in the past" do
    fill_in("datepicker", :with => "2012-12-07")
    fill_in("Start time", :with => "2:00pm")
    fill_in("End time", :with => "4:30pm")
    click_button 'Create Timeslot'
    page.should have_content("Timeslot has not been created.")
  end
end