require 'spec_helper'

describe "studio_assets/new" do
  before(:each) do
    assign(:studio_asset, stub_model(StudioAsset,
      :name => "MyString",
      :base_cost => 1
    ).as_new_record)
  end

  it "renders new studio_asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", studio_assets_path, "post" do
      assert_select "input#studio_asset_name[name=?]", "studio_asset[name]"
      assert_select "input#studio_asset_base_cost[name=?]", "studio_asset[base_cost]"
    end
  end
end
