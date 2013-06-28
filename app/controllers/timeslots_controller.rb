class TimeslotsController < ApplicationController
  before_filter :find_timeslot, only: [:edit, :show, :update, :destroy]
  before_filter :authenticate_user!, only: [:create]

  def index
    @timeslots = Timeslot.all
    respond_to do |format|
      format.html
      format.json { render json: @timeslots }
    end
  end

  def new
    @timeslot = Timeslot.new
    @studio_assets = StudioAsset.all
  end

  def create
    @timeslot = Timeslot.new(params[:timeslot])
    timeslot_date = request.filtered_parameters['timeslot_date'].to_date
    start_time = Time.mktime(timeslot_date.year, timeslot_date.month, timeslot_date.day, @timeslot.start_time.hour, @timeslot.start_time.min)
    end_time = Time.mktime(timeslot_date.year, timeslot_date.month, timeslot_date.day, @timeslot.end_time.hour, @timeslot.end_time.min)
    @timeslot.start_time = start_time
    @timeslot.end_time = end_time
    @timslot.user = current_user
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
