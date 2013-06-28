
require 'spec_helper'

feature 'Creating Timeslots -' do

  before do
    visit "/" 
    click_link "New Timeslot"
  end

  let!(:ts1) { Factory.create(:timeslot, start_time: Time.zone.parse("2015-01-01 09:00:00"), 
    end_time: Time.zone.parse("2015-01-01 11:00:00")) }
  let!(:ts2) { Factory.create(:timeslot, start_time: Time.zone.parse("2015-01-02 11:00:00"), 
    end_time: Time.zone.parse("2015-01-02 13:00:00")) }

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

  scenario "can not create a timeslot that conflicts with another one", :current => true do
    fill_in("datepicker", :with => "2015-01-01")
    fill_in("Start time", :with => "10:00am")
    fill_in("End time", :with => "12:00pm")
    click_button "Create Timeslot"
    page.should have_content("Timeslot conflicts with an existing timeslot")
  end
end