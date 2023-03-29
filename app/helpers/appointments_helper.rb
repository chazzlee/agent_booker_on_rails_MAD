module AppointmentsHelper
  def success_notification(agent_name:, day_of_week:, from:, to:)
    "Your appointment is with #{agent_name} on #{day_of_week} from #{from} to #{to}."
  end

  def local_time(time_with_zone, timezone)
    time_with_zone.in_time_zone(timezone).strftime("%I:%M:%p")
  end
end
