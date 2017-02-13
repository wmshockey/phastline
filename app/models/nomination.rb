class NominationValidator < ActiveModel::Validator
  def validate(record)
    pipeline = Pipeline.find(record.pipeline_id)
    stations = pipeline.stations.map {|s| s.name}
    shipments = record.shipments
    if shipments.any? then
      shipments.each do |a|
        if !stations.include?(a.start_location) then
          record.errors[:base] << "Nomination shipment has start location #{a.start_location} that is not on the pipeline #{pipeline.name}"
        end
        if !stations.include?(a.end_location) then
          record.errors[:base] << "Nomination shipment has end location #{a.end_location} that is not on the pipeline #{pipeline.name}"
        end
      end
    end
  end
end

class Nomination < ActiveRecord::Base
    belongs_to :pipeline
    has_many :shipments, dependent: :destroy
    validates :name, :presence => true
    validates :nom_date, :presence => true
    validates :pipeline_id, :presence => true
    validates :period, :presence => true, numericality: {:greater_than_or_equal_to => 0,  :less_than => 366}
    validates_uniqueness_of :name, scope: :pipeline_id
    validates_with NominationValidator
    default_scope { order('name ASC') }
    
    def copy(nominations, nomination)
      nomination_copy = nomination.dup
      n = 1
      while n <= 100
        new_name = nomination.name + "-copy" + n.to_s
        if nominations.find {|s| s.name == new_name} then
          n = n + 1
        else
          break
        end
      end
      nomination_copy.name = new_name
      nomination_copy.save
      shipments = nomination.shipments
      shipments.each do |s|
        s_copy = s.dup
        s_copy.nomination_id = nomination_copy.id
        s_copy.save
      end
      return nomination_copy
    end
        
end
