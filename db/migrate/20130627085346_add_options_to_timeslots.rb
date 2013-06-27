class AddOptionsToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :notes, :text
    add_column :timeslots, :other, :text
  end
end
