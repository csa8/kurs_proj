class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :order_num, presence: true
  validates :tariff, presence: true

  validates_numericality_of :order_num, :greater_than_or_equal_to => 0
  
  has_many :ignorlists
  has_many :layovers
  has_many :schedules, through: :layovers
end
