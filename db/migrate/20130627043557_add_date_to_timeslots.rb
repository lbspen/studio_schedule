class AddDateToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :timeslot_date, :date
  end
end
