class Schedule < ActiveRecord::Base
  validates :station_end, presence: true
  validates :station_begin, presence: true
  has_many :ignorlists
  has_many :layovers
  has_many :stations, through: :layovers
end
