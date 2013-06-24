class ClientsController < ApplicationController
  def index
    @clients = Client.all
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

  def show
    @client = Client.find(params[:id])
  end
end
