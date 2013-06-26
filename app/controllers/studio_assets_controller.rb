class StudioAssetsController < ApplicationController
  def new
    @studio_asset = StudioAsset.new
    # respond_to do |f|
    #   format.html { redirect_to studio_assets_path }
    #   format.js
    # end
  end
end
