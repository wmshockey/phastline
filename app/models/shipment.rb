class Shipment < ActiveRecord::Base
    belongs_to :nomination
    validates :start_location, :presence => true
    validates :end_location, :presence => true
    validates :shipper, :presence => true
    validates :commodity_id, :presence => true
    validates :volume, :presence => true, numericality: {:greater_than_or_equal_to => 0} 
end
