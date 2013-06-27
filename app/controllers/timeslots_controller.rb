class TimeslotsController < ApplicationController
  before_filter :find_timeslot, :only => [:edit, :show, :update, :destroy]

  def index
    @timeslots = Timeslot.all
    respond_to do |format|
      format.html
      format.json { render json: @timeslots }
    end
  end

  def new
    @timeslot = Timeslot.new
    @date = Date.new
  end

  def create
    # binding.pry
    @timeslot = Timeslot.new(params[:timeslot])
    if @timeslot.save
      redirect_to @timeslot, :notice => "Timeslot has been created."
    else
      flash[:alert] = "Timeslot has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @timeslot.update_attributes(params[:timeslot])
      redirect_to @timeslot, :notice => "Timeslot has been updated."
    else
      flash[:alert] = "Timeslot was not updated."
      render :action => "edit"
    end
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
