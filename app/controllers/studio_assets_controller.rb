class StudioAssetsController < ApplicationController


  def index
    @studio_assets = StudioAsset.all
    respond_to do |format|
      format.html
      format.json { render json: @studio_assets }
    end
  end


  def show
    @studio_asset = StudioAsset.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @studio_asset }
    end
  end



  def new
    @studio_asset = StudioAsset.new

    respond_to do |format|
      format.html
      format.json { render json: @studio_asset }
    end
  end


  def edit
    @studio_asset = StudioAsset.find(params[:id])
  end



  def create
    @studio_asset = StudioAsset.new(params[:studio_asset])

    respond_to do |format|
      if @studio_asset.save
        format.html { redirect_to @studio_asset, notice: 'Studio asset was successfully created.' }
        format.json { render json: @studio_asset, status: :created, location: @studio_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @studio_asset.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    @studio_asset = StudioAsset.find(params[:id])

    respond_to do |format|
      if @studio_asset.update_attributes(params[:studio_asset])
        format.html { redirect_to @studio_asset, notice: 'Studio asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @studio_asset.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @studio_asset = StudioAsset.find(params[:id])
    @studio_asset.destroy

    respond_to do |format|
      format.html { redirect_to studio_assets_url }
      format.json { head :no_content }
    end
  end
end
