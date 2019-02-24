class Result < ApplicationRecord
    belongs_to :simulation
    serialize :station_curve_data  
    serialize :batch_sequence_data   
    serialize :linefill      
end

