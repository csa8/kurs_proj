if !User.exists?
  if (u1 = User.find_by_email('admin@localhost')).nil?
    u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
      email: 'admin@localhost')
    u1.activate!
  end
  if (u2 = User.find_by_email('user@localhost')).nil?
    u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
      email: 'user@localhost')
    u2.activate!
  end
  r1, r2 = Role.create_main_roles
  ru1 = RoleUser.create(role: r1, user: u1)
  ru2 = RoleUser.create(role: r2, user: u2)
end

# :layover).permit(:arrive_time, :ignor, :schedule_id, :station_id,
# :schedule).permit(:mon, :tue, :wed, :thu, :fri, :sat, :sun, :station_begin_id, :station_end_id,
# :station).permit(:name, :tariff, :order_num)
Layover.destroy_all
Schedule.destroy_all
Station.destroy_all

t1 = Time.parse("00:00") + Time.zone.utc_offset
t2 = Time.parse("00:01") + Time.zone.utc_offset
t3 = Time.parse("00:02") + Time.zone.utc_offset

stations = []
number_stations = 5
number_stations.times do |i|
  i+=1
  stations << Station.create(name: "Станция #{i}", tariff: "Тариф #{i%2}", order_num: i)
end

sh1 = Schedule.create(mon: true, tue: true, wed: true, thu: true, fri:true, station_begin: Station.first, station_end: Station.last)
sh2 = Schedule.create(mon: false, sat: true, sun: true, station_begin: Station.first, station_end: stations[number_stations - 2])
sh3 = Schedule.create(mon: true, sat: true, sun: true, station_begin: Station.first, station_end: Station.last)

count = 1
stations.each_with_index do |st, i|
  Layover.create(schedule: sh1, station: st, arrive_time: t1)
  Layover.create(schedule: sh2, station: st, arrive_time: t2) if (i) <= (number_stations-2)
  Layover.create(schedule: sh3, station: st, arrive_time: t3)
end
