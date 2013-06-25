require 'spec_helper'

feature "Deleting Clients - " do

  let!(:client) { Factory.create(:client) }

  before do
    visit clients_path
    @client_name = client.first_name
  end

  after do
    page.should have_content(@client_name)
    click_link "Delete"
    page.status_code.should == 200
    page.should have_content "Client was deleted."
    page.should_not have_content(@client_name)
    page.current_path.should == clients_path
  end

  scenario "Delete client from clients list" do
  end

  scenario "Delete client from individual client view" do
    click_link "View"
  end

end