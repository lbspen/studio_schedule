require 'spec_helper'

feature 'Creating Clients -' do

  before do
    visit clients_path
    click_link "New Client"
  end

  scenario 'Can create a Client' do
    first = "Joe"
    last = "Smith"
    phone = "206-555-1212"
    email = "joe@gmail.com"
    referral = "Friend"

    fill_in("First name", :with => first)
    fill_in("Last name", :with => last)
    fill_in("Phone", :with => phone)
    fill_in("Email", :with => email)
    choose(referral)

    click_button "Create Client"
    page.status_code.should equal 200

    page.should have_content("Client created successfully.") 
    client = Client.all[0]
    page.current_path.should == client_path(client)

    page.should have_content(first)
    page.should have_content(last)
    page.should have_content(phone)
    page.should have_content(email)
    page.should have_content(referral)
  end

  scenario "Can't create with empty fields" do 
    click_button "Create Client"
    page.should have_content("Client was not created.")
    within(".client_email") do
      page.should have_content("can't be blank")
    end       
    within(".client_first_name") do
      page.should have_content("can't be blank")
    end       
    within(".client_last_name") do
      page.should have_content("can't be blank")
    end       
    within(".client_phone") do
      page.should have_content("can't be blank")
    end       
    within(".client_referral_source") do      
      page.should have_content("can't be blank")      
    end
  end

  scenario "Can't create with invalid email" do 
    fill_in("Email", :with => "abcd")
    click_button("Create Client")
    page.should have_content("invalid email format")  
  end

  scenario "Can't create with invalid phone" do
    fill_in("Phone", :with => "513231")
    click_button("Create Client")
    page.should have_content("invalid phone number")  
  end
end

