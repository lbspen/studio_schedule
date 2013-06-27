require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe StudioAssetsController do

  # This should return the minimal set of attributes required to create a valid
  # StudioAsset. As you add validations to StudioAsset, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudioAssetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all studio_assets as @studio_assets" do
      studio_asset = StudioAsset.create! valid_attributes
      get :index, {}, valid_session
      assigns(:studio_assets).should eq([studio_asset])
    end
  end

  describe "GET show" do
    it "assigns the requested studio_asset as @studio_asset" do
      studio_asset = StudioAsset.create! valid_attributes
      get :show, {:id => studio_asset.to_param}, valid_session
      assigns(:studio_asset).should eq(studio_asset)
    end
  end

  describe "GET new" do
    it "assigns a new studio_asset as @studio_asset" do
      get :new, {}, valid_session
      assigns(:studio_asset).should be_a_new(StudioAsset)
    end
  end

  describe "GET edit" do
    it "assigns the requested studio_asset as @studio_asset" do
      studio_asset = StudioAsset.create! valid_attributes
      get :edit, {:id => studio_asset.to_param}, valid_session
      assigns(:studio_asset).should eq(studio_asset)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new StudioAsset" do
        expect {
          post :create, {:studio_asset => valid_attributes}, valid_session
        }.to change(StudioAsset, :count).by(1)
      end

      it "assigns a newly created studio_asset as @studio_asset" do
        post :create, {:studio_asset => valid_attributes}, valid_session
        assigns(:studio_asset).should be_a(StudioAsset)
        assigns(:studio_asset).should be_persisted
      end

      it "redirects to the created studio_asset" do
        post :create, {:studio_asset => valid_attributes}, valid_session
        response.should redirect_to(StudioAsset.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved studio_asset as @studio_asset" do
        # Trigger the behavior that occurs when invalid params are submitted
        StudioAsset.any_instance.stub(:save).and_return(false)
        post :create, {:studio_asset => { "name" => "invalid value" }}, valid_session
        assigns(:studio_asset).should be_a_new(StudioAsset)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        StudioAsset.any_instance.stub(:save).and_return(false)
        post :create, {:studio_asset => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested studio_asset" do
        studio_asset = StudioAsset.create! valid_attributes
        # Assuming there are no other studio_assets in the database, this
        # specifies that the StudioAsset created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        StudioAsset.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => studio_asset.to_param, :studio_asset => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested studio_asset as @studio_asset" do
        studio_asset = StudioAsset.create! valid_attributes
        put :update, {:id => studio_asset.to_param, :studio_asset => valid_attributes}, valid_session
        assigns(:studio_asset).should eq(studio_asset)
      end

      it "redirects to the studio_asset" do
        studio_asset = StudioAsset.create! valid_attributes
        put :update, {:id => studio_asset.to_param, :studio_asset => valid_attributes}, valid_session
        response.should redirect_to(studio_asset)
      end
    end

    describe "with invalid params" do
      it "assigns the studio_asset as @studio_asset" do
        studio_asset = StudioAsset.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StudioAsset.any_instance.stub(:save).and_return(false)
        put :update, {:id => studio_asset.to_param, :studio_asset => { "name" => "invalid value" }}, valid_session
        assigns(:studio_asset).should eq(studio_asset)
      end

      it "re-renders the 'edit' template" do
        studio_asset = StudioAsset.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        StudioAsset.any_instance.stub(:save).and_return(false)
        put :update, {:id => studio_asset.to_param, :studio_asset => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested studio_asset" do
      studio_asset = StudioAsset.create! valid_attributes
      expect {
        delete :destroy, {:id => studio_asset.to_param}, valid_session
      }.to change(StudioAsset, :count).by(-1)
    end

    it "redirects to the studio_assets list" do
      studio_asset = StudioAsset.create! valid_attributes
      delete :destroy, {:id => studio_asset.to_param}, valid_session
      response.should redirect_to(studio_assets_url)
    end
  end

end
