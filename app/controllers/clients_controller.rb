class ClientsController < ApplicationController
  def index
  end

  def new
    @client = Client.new
  end

  def create
    flash[:notice] = "Client created successfully."
    redirect_to :action => index
  end
end
