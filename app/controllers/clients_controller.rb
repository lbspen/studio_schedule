class ClientsController < ApplicationController
  def index
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    @client.save
    redirect_to @client, :notice => "Client created successfully."
  end

  def show
    @client = Client.find(params[:id])
  end
end
