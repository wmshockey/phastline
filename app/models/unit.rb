class Unit < ActiveRecord::Base
  belongs_to :station
  validates :station_id, :presence => true
  validates :pump_id, :presence => true
  validates :unit_row, :presence => true, numericality: { only_integer: true }
  validates :unit_column, :presence => true, numericality: { only_integer: true }
end
