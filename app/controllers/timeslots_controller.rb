class TimeslotsController < ApplicationController
  def index
  end

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(params[:timeslot])
    @timeslot.save
    redirect_to @timeslot, :notice => "Timeslot has been created."
  end

  def show
    @timeslot = Timeslot.find(params[:id])  
  end
end
