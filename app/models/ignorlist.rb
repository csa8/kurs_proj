class Ignorlist < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :station

  validates :schedule_id, uniqueness: {scope: [:station_id]}
end
