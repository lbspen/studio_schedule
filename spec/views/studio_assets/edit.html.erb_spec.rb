require 'spec_helper'

describe "studio_assets/edit" do
  before(:each) do
    @studio_asset = assign(:studio_asset, stub_model(StudioAsset,
      :name => "MyString",
      :base_cost => 1
    ))
  end

  it "renders the edit studio_asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", studio_asset_path(@studio_asset), "post" do
      assert_select "input#studio_asset_name[name=?]", "studio_asset[name]"
      assert_select "input#studio_asset_base_cost[name=?]", "studio_asset[base_cost]"
    end
  end
end
