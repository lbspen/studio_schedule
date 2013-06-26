class ClientsController < ApplicationController
  before_filter :find_client, :only => [:show, :edit, :update, :destroy] 

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to @client, :notice => "Client created successfully."
    else
      flash[:alert] = "Client was not created."
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @client.update_attributes(params[:client])
      redirect_to @client, :notice => "Client has been updated."
    else
      flash[:alert] = "Client has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @client.destroy
    flash[:notice] = "Client was deleted."
    redirect_to clients_path
  end

  private

  def find_client
    @client = Client.find(params[:id])
  end
end
