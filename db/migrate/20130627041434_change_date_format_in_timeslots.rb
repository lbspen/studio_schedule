class ChangeDateFormatInTimeslots < ActiveRecord::Migration
  def up
    change_column :timeslots, :start_time, :datetime
    change_column :timeslots, :end_time, :datetime
  end

  def down
    change_column :timeslots, :start_time, :date
    change_column :timeslots, :end_time, :date
  end
end
