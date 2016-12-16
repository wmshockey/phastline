class Headpoint < ActiveRecord::Base
    belongs_to :pump
    validates :pump_id, :presence => true
    validates :flow, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 100000}
    validates :head, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 10000}
end
