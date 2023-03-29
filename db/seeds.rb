require "csv"

puts "Seeding started..."

strip_offset_regex = /\([^)]+\)\s*(.+)/

filename = "RORP1D.csv"

CSV.foreach(Rails.root.join("lib", "data", filename), headers: true) do |row|
  agent_row = row.to_hash

  full_timezone = agent_row["Timezone"].strip
  short_name = full_timezone.match(strip_offset_regex)[1]
  offset = ActiveSupport::TimeZone.new(short_name).formatted_offset
  timezone = Timezone.find_or_create_by!(full_name: full_timezone, offset: offset, short_name: short_name)
  agent = timezone.agents.find_or_create_by!(name: agent_row["Name"].strip)

  start_range = Time.zone.parse("#{agent_row["Available at"].strip} #{agent_row["Timezone"]}").utc.seconds_since_midnight
  end_range = Time.zone.parse("#{agent_row["Available until"].strip} #{agent_row["Timezone"]}").utc.seconds_since_midnight

  (start_range...end_range).step(30.minutes).to_a.each do |time_in_seconds|
    agent.availabilities.create!(
      day_of_week: agent_row["Day of Week"].strip,
      start_at: Time.zone.at(time_in_seconds).utc,
      end_until: Time.zone.at(time_in_seconds + 30.minutes)
    )
  end
end

puts "Seeding finished!"
