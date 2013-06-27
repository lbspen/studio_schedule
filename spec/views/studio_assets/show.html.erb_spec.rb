require 'spec_helper'

describe "studio_assets/show" do
  before(:each) do
    @studio_asset = assign(:studio_asset, stub_model(StudioAsset,
      :name => "Name",
      :base_cost => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
