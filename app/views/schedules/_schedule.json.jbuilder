json.extract! schedule, :id, :mon, :tue, :wed, :thu, :fri, :sat, :sun, :station_begin, :station_end, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
