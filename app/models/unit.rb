class Unit < ApplicationRecord
  belongs_to :station
  validates :station_id, :presence => true
  validates :pump_id, :presence => true
  validates :unit_row, :presence => true, numericality: { only_integer: true, :greater_than_or_equal_to => 1,  :less_than => 20 }
  validates :unit_column, :presence => true, numericality: { only_integer: true, :greater_than_or_equal_to => 1,  :less_than => 20 }
  validates_uniqueness_of :unit_column, scope: [:station_id, :unit_row]
  default_scope { order(station_id: :asc, unit_row: :asc, unit_column: :asc) }
end

