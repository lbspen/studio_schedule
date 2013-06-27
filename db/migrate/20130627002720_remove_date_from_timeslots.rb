class RemoveDateFromTimeslots < ActiveRecord::Migration
  def up
    remove_column :timeslots, :recording_session_date
    change_column :timeslots, :start_time, :datetime
    change_column :timeslots, :end_time, :datetime
  end

  def down
    add_column :timeslots, :recording_session_date, :date
    change_column :timeslots, :start_time, :time
    change_column :timeslots, :end_time, :time
  end
end
