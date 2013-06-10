require 'spec_helper'

feature 'Creating Clients -' do

  before do
    visit clients_path
    click_link "New Client"
  end
   
  scenario 'Can create a Client' do
    # fill_in("First name", :with => "Joe")
    click_button "Create Client"
    page.should have_content("Client created successfully.") 
    # page.should have_content("Joe")
  #   page.find_link("Back")[:href].should == root_path
  end

  # scenario "can not create a timeslot in the past" do
  #   select_date("2012,December,7", :from => "Recording session date") 
  #   select_time("02 PM", "00", :from => "Start time")
  #   select_time("04 PM", "30", :from => "End time")
  #   click_button 'Create Timeslot'
  #   page.should have_content("Timeslot has not been created.")
  # end
end