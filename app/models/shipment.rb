class Shipment < ActiveRecord::Base
    belongs_to :nomination
    validates :start_location, :presence => true
    validates :end_location, :presence => true
    validates :shipper, :presence => true
    validates :commodity_id, :presence => true
    validates :volume, :presence => true, numericality: {:greater_than => 0} 
    default_scope { order(nomination_id: :asc, start_location: :asc) }
    after_commit :update_nomination, on: [:create, :update]

    def update_nomination
      if self.nomination.persisted?
        self.nomination.touch
        self.nomination.save
      end
    end
          
end
