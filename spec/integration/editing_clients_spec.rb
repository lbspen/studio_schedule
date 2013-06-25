require 'spec_helper'

feature "Editing Clients -" do 
  let!(:client) { Factory.create(:client) }

  before do
    visit clients_path
    click_link "Edit"
    page.status_code.should equal 200
  end

  scenario "Can edit a client" do
    new_name = "Sophia"
    fill_in "First name", :with => new_name

    click_button "Update Client"
    page.status_code.should equal 200
    page.current_path.should == client_path(client)
    page.should have_content("Client has been updated.")
  end

  scenario "Can't update invalid values" do
    fill_in "First name", :with => ""

    click_button "Update Client"
    page.status_code.should equal 200
    page.current_path.should == client_path(client)
    page.should have_content("Client has not been updated.")
    within(".client_first_name") do
      page.should have_content("can't be blank")
    end
  end
end
