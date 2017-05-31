class Layover < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :station
  accepts_nested_attributes_for :station, allow_destroy: true
  validates :schedule_id, uniqueness: {scope: [:station_id]}
end
