require 'spec_helper'

feature 'Creating Timeslots -' do

  before do
    visit "/" 
    click_link "New Timeslot"
  end
   
  scenario 'Can create a Timeslot' do
    select_date("2013,December,7", :from => "Recording session date") 
    select_time("02 PM", "00", :from => "Start time")
    select_time("04 PM", "30", :from => "End time")
    click_button "Create Timeslot" 
    page.should have_content("Timeslot has been created")
    page.should have_content("December 7, 2013")
    page.should have_content("2:00pm")
    page.should have_content("4:30pm")
    page.find_link("Back")[:href].should == root_path
  end

  scenario "can not create a timeslot in the past" do
    select_date("2012,December,7", :from => "Recording session date") 
    select_time("02 PM", "00", :from => "Start time")
    select_time("04 PM", "30", :from => "End time")
    click_button 'Create Timeslot'
    page.should have_content("Timeslot has not been created.")
  end
end