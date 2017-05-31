class Schedule < ActiveRecord::Base
  validates :station_end_id, presence: true
  validates :station_begin_id, presence: true
  has_many :layovers, dependent: :destroy
  has_many :stations, through: :layovers
  belongs_to :station_begin, class_name: "Station"
  belongs_to :station_end, class_name: "Station"
  accepts_nested_attributes_for :stations, allow_destroy: true
  accepts_nested_attributes_for :layovers, allow_destroy: true
end
