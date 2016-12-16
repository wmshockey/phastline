class Result < ActiveRecord::Base
    belongs_to :pipeline
    serialize :station_curve_data  
    serialize :batch_sequence_data         
end

