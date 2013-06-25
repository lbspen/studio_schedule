class TimeslotSerializer < ActiveModel::Serializer
  attributes :title, :start, :end, :allDay

  def end
    "#{object.recording_session_date}"+" "+
    "#{object.end_time.to_s.split(" ")[1].to_s[0..-4]}"
  end
  def start
    "#{object.recording_session_date}"+" "+
    "#{object.start_time.to_s.split(" ")[1].to_s[0..-4]}"
  end
  def title
    "Not Available"
  end
  def allDay
    false
  end
end
