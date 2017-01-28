class Pump < ActiveRecord::Base
  belongs_to :user
  has_many :headpoints, dependent: :destroy
  validates :pump_id, :presence => true
  validates :flow_units, :presence => true
  validates :head_units, :presence => true;
  validates :pressure_units, :presence => true
  validates :minimum_suction, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 1000}
  validates :stages, numericality: {:greater_than => 0, :less_than => 20}
  validates :efficiency_correction_factor, :presence => true, numericality: {:greater_than => 0, :less_than_or_equal_to => 1}
  validates :capacity_correction_factor, :presence => true, numericality: {:greater_than => 0, :less_than_or_equal_to => 1}
  validates :head_correction_factor, :presence => true, numericality: {:greater_than => 0, :less_than_or_equal_to => 1}
  default_scope { order(user_id: :asc, pump_id: :asc) }
  
end
