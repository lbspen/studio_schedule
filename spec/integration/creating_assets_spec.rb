require 'spec_helper'

feature "Creating Assets -" do 

  scenario "Can create a recording session" do
    visit new_studio_asset_path
    total_field = find_field("Total")
    total_field.value.should == "0"
    # hours = 1
    # fill_in("Studio hours", :with => hours)
    # find_field("Studio hours").trigger("blur")
    # total_field.value.should == 45
  end 
end
