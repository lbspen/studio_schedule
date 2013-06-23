require 'spec_helper'

feature 'Creating Clients -' do

  before do
    visit clients_path
    click_link "New Client"
  end
   
  scenario 'Can create a Client' do
    first = "Joe"
    last = "Smith"
    phone = "555-1212"
    email = "joe@gmail.com"
    referral = "Friend"

    fill_in("First name", :with => first)
    fill_in("Last name", :with => last)
    fill_in("Phone", :with => phone)
    fill_in("Email", :with => email)
    choose(referral)

    click_button "Create Client"
    page.status_code.should equal 200

    client = Client.all[0]
    page.current_path.should == client_path(client)

    page.should have_content("Client created successfully.") 
    page.should have_content(first)
    page.should have_content(last)
    page.should have_content(phone)
    page.should have_content(email)
    page.should have_content(referral)
  #   page.find_link("Back")[:href].should == root_path
  end
end

