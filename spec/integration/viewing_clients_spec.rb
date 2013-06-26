require 'spec_helper'

feature 'Viewing Clients -' do
  let!(:client1) { Factory.create(:client, 
    :first_name => "Emily") }
  let!(:client2) { Factory.create(:client, 
    :first_name => "Mingus", :last_name => "Cat") }

  scenario "Viewing all clients" do
    visit clients_path
    page.should have_content(client1.first_name)
    page.should have_content(client1.last_name)
    page.should have_content(client2.first_name)
    page.should have_content(client2.last_name)
    page.should have_link("Edit", :href => edit_client_path(client1))
    page.should have_link("Edit", :href => edit_client_path(client2))
    page.should have_link("View", :href => client_path(client1))
    page.should have_link("View", :href => client_path(client2))
  end

  scenario "Viewing one client" do
    visit client_path(client1)   
    page.should have_content(client1.first_name)
    page.should have_content(client1.last_name)
    page.should have_content(client1.phone)
    page.should have_content(client1.email)
    page.should have_content(client1.referral_source)
    page.should have_link("Edit", :href => edit_client_path(client1))
    page.should have_link("View", :href => client_path(client1))
  end
end
