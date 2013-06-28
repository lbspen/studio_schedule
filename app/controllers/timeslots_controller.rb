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
    @timeslot.user = current_user
    if @timeslot.save
      redirect_to timeslots_confirmation_path, :notice => "Timeslot has been created."
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
    construct_datetimes
    if @timeslot.save
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

  def construct_datetimes
    timeslot_date_str = params['timeslot_date']
    start_time_str = DateTime.parse(params['timeslot']['start_time']).strftime("%H:%M:%S")
    end_time_str = DateTime.parse(params['timeslot']['end_time']).strftime("%H:%M:%S")
    start_time = Time.zone.parse(timeslot_date_str + ' ' + start_time_str)
    end_time = Time.zone.parse(timeslot_date_str + ' ' + end_time_str)
    @timeslot.update_attribute(:start_time, start_time)
    @timeslot.update_attribute(:end_time, end_time)
  end
end
