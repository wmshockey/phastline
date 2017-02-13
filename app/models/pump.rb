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
  validates_uniqueness_of :pump_id, scope: :user_id
  default_scope { order(user_id: :asc, pump_id: :asc) }

  def copy(pumps, pump)
    pump_copy = pump.dup
    n = 1
    while n <= 100
      new_id = pump.pump_id + "-copy" + n.to_s
      if pumps.find {|s| s.pump_id == new_id} then
        n = n + 1
      else
        break
      end
    end
    pump_copy.pump_id = new_id
    pump_copy.save
    headpoints = pump.headpoints
    headpoints.each do |a|
      a_copy = a.dup
      a_copy.pump_id = pump_copy.id
      a_copy.save
    end
    return pump_copy
  end

  
end
