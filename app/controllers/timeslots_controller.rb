class TimeslotsController < ApplicationController
  before_filter :find_timeslot, :only => [:edit, :show, :update, :destroy]

  def index
    @timeslots = Timeslot.all
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
  end

  def edit
  end

  def update
    @timeslot.update_attributes(params[:timeslot])
    redirect_to @timeslot, :notice => "Timeslot has been updated."  
  end

  def destroy
    @timeslot.destroy
    redirect_to timeslots_path, :notice => "Timeslot has been deleted."
  end
  
  private
  def find_timeslot
    @timeslot = Timeslot.find(params[:id])  
  end

end
