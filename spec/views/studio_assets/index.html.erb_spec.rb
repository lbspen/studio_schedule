require 'spec_helper'

describe "studio_assets/index" do
  before(:each) do
    assign(:studio_assets, [
      stub_model(StudioAsset,
        :name => "Name",
        :base_cost => 1
      ),
      stub_model(StudioAsset,
        :name => "Name",
        :base_cost => 1
      )
    ])
  end

  it "renders a list of studio_assets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
