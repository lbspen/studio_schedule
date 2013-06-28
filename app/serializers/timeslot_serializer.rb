class TimeslotSerializer < ActiveModel::Serializer
  attributes :title, :start, :end, :allDay

  def start
    object.start_time
  end

  def end
    object.end_time
  end

  def title
    "Not Available"
  end

  def allDay
    false
  end

end
