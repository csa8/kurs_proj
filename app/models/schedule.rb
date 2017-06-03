class Schedule < ActiveRecord::Base
  validates :station_end_id, presence: true
  validates :station_begin_id, presence: true
  has_many :layovers, dependent: :destroy
  has_many :stations, through: :layovers
  belongs_to :station_begin, class_name: "Station"
  belongs_to :station_end, class_name: "Station"
  accepts_nested_attributes_for :stations, allow_destroy: true
  accepts_nested_attributes_for :layovers, allow_destroy: true


  def self.search(params)
    result = Schedule.includes(:layovers => :station).references(:station)
    if params['mon'] == 'true'
      result = result.where(mon: params['mon'])
    end
    if params['tue'] == 'true'
      result = result.where(tue: params['tue'])
    end
    if params['wed'] == 'true'
      result = result.where(wed: params['wed'])
    end
    if params['thu'] == 'true'
      result = result.where(thu: params['thu'])
    end
    if params['fri'] == 'true'
      result = result.where(fri: params['fri'])
    end
    if params['sat'] == 'true'
      result = result.where(sat: params['sat'])
    end
    if params['sun'] == 'true'
      result = result.where(sun: params['sun'])
    end
    if params['station_from'].present?
      result = result.where(layovers: {station: params['station_from'], ignor: false})
    end
    if params['station_to'].present?
      if params['arrive_time(4i)'].present? && params['arrive_time(5i)'].present?
        result = result.where(layovers: {
          arrive_time: Time.parse("#{params['arrive_time(4i)']}:#{params['arrive_time(5i)']}") + Time.zone.utc_offset,
          ignor: false
          })
      end
      result = result.where(layovers: {station: params['station_to']})
    end
    if params['tariff'].present?
      result = result.where(stations: {tariff: params['tariff']})
    end
    result.all
  end
end
