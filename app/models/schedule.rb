class Schedule < ActiveRecord::Base
    belongs_to :simulation
    has_many :activities, dependent: :destroy
    validates :name, :presence => true
    validates :description, allow_blank: true, length: { maximum: 512 }
    validates :start_date, :presence => true
    validates :period, :presence => true, numericality: {:greather_than_or_equal_to => 0, :less_than => 366}
    validates :pipeline_name, allow_blank: true, length: { maximum: 512 }
    validates :sched_type, :presence => true, inclusion: { in: %w(PRIOR PRELIMINARY SIMULATED), message: "%{value} is not a valid schedule type" }


    def initialize_batch_sequence(prior_activities, statar)
#     Go through previous schedule to identify injections and reciepts to get list of batches
      prior_activities = prior_activities.sort_by {|t| t.start_time}
      batches = Array.new
      prior_activities.each do |s|
        if s.activity_type == "INJECTION" or s.activity_type == "RECEIPT" then
          batch_temp = s.batch_id.partition("-")
          commodity_id = batch_temp[0]
          batch_number = batch_temp[2].partition(" ")[0]
          batches << Batchrec.new(batch_number, commodity_id, s.volume, s.station, "Superior", s.shipper, 0)
        end
      end
#     Assign the batch id's
      batches.each_with_index do |b, bix|
        b.batch_id = b.commodity_id + "-" + b.batch_number.to_s.rjust(5, "0")
      end
#     Create the two-dimensional batch sequence array
      max_batches = batches.count
      bs = Array.new(statar.count-1){Array.new(max_batches)}
      batches.each_with_index do |b, btix|
        start_loc = b.start_location
        station_rec = statar.detect {|s| s.name == start_loc}
        start_kmp = station_rec.kmp
        end_loc = b.end_location
        station_rec = statar.detect {|s| s.name == end_loc}
        end_kmp = station_rec.kmp
        statar[0...-1].each_with_index do |s, stix|
          stat = s.name
          kmp = s.kmp
          if start_kmp <= kmp and end_kmp > kmp then
            bs[stix][btix] = batches[btix].dup
          else
            bs[stix][btix] = batches[btix].dup
            bs[stix][btix].volume = 0.0
          end
          s.sequence_volume = s.sequence_volume + bs[stix][btix].volume
        end
      end
      return bs
    end     

end