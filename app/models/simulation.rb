class Simulation < ActiveRecord::Base
    attr_accessor :lfill
    attr_accessor :viscar
    attr_accessor :tempar
    attr_accessor :densar
    attr_accessor :slossar
    attr_accessor :minpressar
    attr_accessor :maxpressar
    attr_accessor :dlossar
    attr_accessor :flowar
    attr_accessor :suctar
    attr_accessor :headar
    attr_accessor :stepar
    attr_accessor :elevar
    attr_accessor :volmar
    attr_accessor :statar
    attr_accessor :btsqar
    attr_accessor :ratear
    attr_accessor :flowar
    attr_accessor :stepar
    attr_accessor :statcv
    attr_accessor :summary_results
    attr_accessor :prior_activities
    has_many :results, dependent: :destroy
    validates :name, :presence => true
    validates :pipeline_name, :presence => true
    validates :nomination_name, :presence => true
    validates :max_flowrate, :presence => true, numericality: {:greater_than => 0, :less_than => 100000}
    validates :max_batchsize, :presence => true, numericality: {:greater_than => 0, :less_than => 500000}


# Mainline driver code
    def run
        define_all_constants
        @pipelines = Pipeline.all
        @nominations = Nomination.all
        @schedules = Schedule.all
        @commodities = Commodity.all
        @pumpar = Pump.all
        @units = Unit.all
        Result.delete_all
        @pipeline = @pipelines.detect{ |p| p.name == pipeline_name }
        @schedule = @schedules.detect{|s| s.name == schedule_name}
        @nomination = @nominations.detect{ |n| n.name == nomination_name }
        @shipments = @nomination.shipments
        @stations = @pipeline.stations
        @prior_activities = @schedule.activities 
        @segmar = @pipeline.segments.sort_by { |a| a.kmp}
        @volmar = @pipeline.get_volumes
        @tempar = @pipeline.get_all_temps
        @maxpressar = @pipeline.get_all_maxpress
        @elevar = @pipeline.get_all_elevations
        @statar = @pipeline.get_all_stations(@volmar)
        @statcv = @pipeline.get_station_curves(@statar, @pumpar)     #Get the combined station curves
        data_integrity_checks(@pipeline)
        if self.errors.empty? then          
  #       Initialize the Batch Sequence with prior activities
          @btsqar = @schedule.initialize_batch_sequence(@prior_activities, @statar)
  #       Add the new batches from the nominations onto the end of the existing batch sequence
          @btsqar = @schedule.finalize_batch_sequence(max_batchsize, @btsqar, @shipments, @statar)      
  #       Set initial positioning of batches in the line (linefill)
          initial_batch_positioning(@statar, @btsqar, @volmar)
          $step = 1; stepdone = false; $timestamp = 0.0
          @stepar = Array.new
  #       Perform each step, iterating on flowrate to find the maximum, then shifting the linefill ahead to the next time-step
          while not stepdone
            @lfill = linefill(@statar, @btsqar, @volmar)
            @viscar = visc_profile(@lfill, @tempar)
            @densar = dens_profile(@lfill, @tempar)
            @slossar = static_loss(@densar, @elevar)
            @minpressar = min_press(@lfill)
            @suctar = suct_calc(@lfill)
            @ratear = calc_rate_ratios(@statar, @btsqar)
            iter = 1; iterdone = false; flow = max_flowrate; new_flow = max_flowrate
            viol = -9.0e9
  #         Iterate on flowrate to find the maximum flow (capacity rate)
            while not iterdone
              prev_flow = flow
              prev_viol = viol
              flow = new_flow
              @flowar = calc_flowrates(flow, ratear)
              @headar = head_calc(@statar, @statcv, @flowar, @densar)
              @dlossar = dynamic_loss(@flowar, @segmar, @viscar, @densar)
              steprecs = step_calc(@statar, @flowar, @btsqar, @suctar, @headar, @slossar, @dlossar, @maxpressar, @minpressar)
  #           Adjust the flowrate to converge on the capacity flow rate
              new_flow, viol, iterdone = adjust_flow(flow, prev_flow, prev_viol, iter, steprecs)
              iterdone = true if flow == max_flowrate and viol <= 0
              if flow <= 0.0 and viol > 0 then
                self.errors.add(:base, "Flowrate iterations cannot converge in step #{$step}")
                iterdone = true
              end
              iter = iter + 1 if not iterdone
            end
  #         Shift batches into position for the next step, then save the step results
            stepdone, time_shift = step_shift_volumes(@statar, @btsqar, @flowar)
  #         Update the step records with the step duration time (time_shift)
            steprecs.each {|r| r.step_time = time_shift}
  #         Save the linefill in the results
            steprecs.first.linefill = @lfill
            @stepar = @stepar + steprecs
            $step = $step + 1
            if $step > 1000 then
              self.errors.add(:base, "Number of steps exceeds 1000.  Simulation stopped at step 1000")
              stepdone = true
            end
          end
          $maxsteps = $step - 1
  #       Save step results in database table for user viewing
          save_results
        end
        if self.errors.empty? then          
          return true
        else 
          return false
        end
    end

    def define_all_constants
#     Constants and conversion factors
      $Gconstant = 0.00980652       # Gravitational constant (km/sec2)
#     US to metric
      $M3dy_m3hr = 0.04166666       #conversion from m3/dy to m3/hr
      $Blhr_m3hr = 0.15898251       #conversion from bl/hr to m3/hr
      $Bldy_m3hr = 0.00662427       #conversion from bl/dy to m3/hr
      $Gpm_m3hr  = 0.2271253        #conversion from gpm   to m3/hr
      $Bl_m3     = 0.15898251       #conversion from bl to m3
      $Psig_kpa  = 6.8944           #conversion from psig to kpa
      $Miles_km  = 1.60934          #conversion from miles to km
      $In_m      = 0.0254           #conversion from in to m
      $Ft_m      = 0.3048           #conversion from ft to m
#     Metric to US
      $M3hr_m3dy   = 24.0           #conversion from m3/hr to m3/dy
      $M3hr_blhr   = 6.29           #conversion from m3/hr to bl/hr
      $M3hr_bldy   = 150.960030     #conversion from m3/hr to bl/dy
      $M3hr_gpm    = 4.40285604     #conversion from m3/hr to gpm
      $M3_bl       = 6.29           #conversion from m3 to bl
      $Kpa_psig    = 0.14504525     #conversion from kpa to psig
      $Km_miles    = 0.62137274     #conversion from km to miles
      $M_in        = 39.3700787     #conversion from m to in
      $M_ft        = 3.28083989     #conversion from m to ft      
    end

    def data_integrity_checks(pipeline)
#     Check for any missing or empty input data
      if @pipeline.nil? then self.errors.add(:base, "Pipeline cannot be found") end
      if @nomination.nil? then self.errors.add(:base, "Nomination cannot be found") end
      if @shipments.empty? then self.errors.add(:base, "Nomination does not contain any shipments") end
      if @schedule.nil? then self.errors.add(:base, "Schedule cannot be found") end
      if @prior_activities.nil? then self.errors.add(:base, "Schedule does not contain any activities") end
      if @stations.empty? then self.errors.add(:base, "Pipeline does not have any stations") end
      if @segmar.empty? then self.errors.add(:base, "Pipeline does not have any pipe segments") end  
      if @tempar.empty? then self.errors.add(:base, "Pipeline does not have any temperatures specified") end
      if @elevar.empty? then self.errors.add(:base, "Pipeline does not have any elevations specified") end
      if pipeline.stations.count <= 1 then
        pipeline.errors.add(:base, "No station specified at end of line")
      end
      if pipeline.segments[0].kmp != pipeline.stations[0].kmp then
        pipeline.errors.add(:base, "Pipeline segments not specified for first station in the line")
      end
      if pipeline.segments.last.kmp > pipeline.stations.last.kmp then
        pipeline.errors.add(:base, "Pipeline segments are specified beyond last station on the line")
      end
      if pipeline.segments.last.kmp < pipeline.stations.last.kmp then
        pipeline.errors.add(:base, "Pipeline segments must include an entry for the last point on the line")
      end
      if pipeline.elevations[0].kmp != pipeline.stations[0].kmp then
        pipeline.errors.add(:base, "Pipeline elevations not specified for first station in the line")
      end
      if pipeline.elevations.last.kmp > pipeline.stations.last.kmp then
        pipeline.errors.add(:base, "Pipeline elevations are specified beyond last station on the line")
      end
      if pipeline.elevations.last.kmp != pipeline.stations.last.kmp then
        pipeline.errors.add(:base, "There must be an elevation specified for the last point on the line")
      end
      if pipeline.temperatures[0].kmp != pipeline.stations[0].kmp then
        pipeline.errors.add(:base, "Pipeline temperatures not specified for first station in the line")
      end
      if pipeline.temperatures.last.kmp > pipeline.stations.last.kmp then
        pipeline.errors.add(:base, "Pipeline temperatures are specified beyond last station on the line")
      end
      if @pipeline.errors.any? then
        self.errors.add(:base, @pipeline.errors.full_messages)
      end
#     Check to ensure the stations listed for the pipeline, nomination and prior schedule all match
      pipeline_stations = @statar.map {|s| s.name}
      schedule_stations = (@prior_activities.map {|s| s.station}).uniq
      nomination_stations = (@shipments.map {|s| s.start_location} + @shipments.map {|t| t.end_location}).uniq
      schedule_stations.each do |stn|
        if not pipeline_stations.include? stn then
          self.errors.add(:base, "Station #{stn} listed in the prior schedule #{@schedule.name} is not a station listed for pipeline #{@pipeline.name}")
        end
      end
      nomination_stations.each do |stn|
        if not pipeline_stations.include? stn then
          self.errors.add(:base, "Station #{stn} listed in the nomination #{@nomination.name} is not a station listed for pipeline #{@pipeline.name}")
        end
      end
    end
      

    def cole_loss(flow, visc, dens, diam, thick, ruff)
#   Calculate the dynamic (flowing) pressure loss of a pipe segment using the Colebrook White equation.
      error = 2.5e-5
      kreyn = 353.677499
      kdarc = 6.25439455e-8
      diam = diam - 2*thick
      reynl = kreyn*flow/(diam*visc)
      if reynl>40000.0 then
        tcons = ruff/diam/3.7
        estim = 1/(-2*Math.log10(tcons + 5.74/(reynl**0.9)))
        diff = 10000.0
        while diff > error do
          temp = 1/(-2*Math.log10(tcons + 2.51/reynl/estim))
          diff = (estim-temp).abs
          estim = temp
        end
        frict = temp**2
      elsif reynl>2500.0 then frict = 0.364/(reynl**0.265)
      elsif (reynl>2000) and (reynl<=2500) then frict = (reynl**1.596)/5700000.0
      elsif (reynl>0.01) and (reynl<=2000) then frict = 64.0/reynl
      elsif (reynl<=0.01) then frict = 10000.0
      end
      return kdarc*dens*frict*flow**2/(diam**5)
    end


    def initial_batch_positioning(statar, btsqar, volmar)
#   Calculate the initial linefill by setting the initial_volume setting for each station.
#   The initial volume setting for each station is the total sequence volume for the station minus the pipe volume to that point in the line.
    stn_ix = 0
    while stn_ix < statar.count - 1
      kmp = statar[stn_ix].kmp
      stat = statar[stn_ix].name
      sequence_volume = statar[stn_ix].sequence_volume
      pipe_volume_to_station = volmar.interpolate_y(kmp)
      statar[stn_ix].initial_volume = sequence_volume - pipe_volume_to_station
      stn_ix = stn_ix + 1
    end
  end

          
=begin
    def initial_batch_positioning(statar, btsqar, volmar)
#     Calculate the linefill.  Fill the line between stations with commodities using the batch sequence array.
      lf = Array.new
      stn_ix = 0
      kmp = statar[stn_ix].kmp
      stat = statar[stn_ix].name
      max_batch = btsqar[0].size - 1
#     Specify initial split across first station
      batch = max_batch
      batch_vol = btsqar[stn_ix][batch].volume
#     Calculate the linefill between stations.
      while stn_ix < statar.count - 1
        stat = statar[stn_ix].name
        kmp = statar[stn_ix].kmp
        vol = volmar.interpolate_y(kmp)
        kmp_end = statar[stn_ix + 1].kmp
        vol_end = volmar.interpolate_y(kmp_end)
#       Determine initial volume pumped
        initial_volume = 0
        bix = 0
        while bix != batch 
          initial_volume = initial_volume + btsqar[stn_ix][bix].volume
          if bix < max_batch then bix = bix+1 else bix = 0 end
        end
#       Adjust the volume of the downstream batch at this station based on volume of batch left on the upstream side.
#        if stn_ix > 0 and batch_vol > 0 then
#          fraction_left_on_upstream_batch = batch_vol / btsqar[stn_ix - 1][batch].volume
#          volume_left_on_downstream_batch = btsqar[stn_ix][batch].volume * fraction_left_on_upstream_batch
#          batch_vol = btsqar[stn_ix][batch].volume - volume_left_on_downstream_batch
#        end
        initial_volume = initial_volume + batch_vol
        statar[stn_ix].initial_volume = initial_volume        
#       Get batch split at downstream station
        pipe_volume = volmar.interpolate_y(kmp_end) - volmar.interpolate_y(kmp)
        volume_shift = statar[stn_ix].initial_volume + statar[stn_ix].pumped_volume - pipe_volume
        upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix)
        batch = downstream_batch
        batch_vol = downstream_vol
        stn_ix = stn_ix + 1
      end      
    end  
=end         


    def linefill(statar, btsqar, volmar)
#     Calculate the linefill.  Fill the line between stations with commodities using the batch sequence array.
      lf = Array.new
      stn_ix = 0
      kmp = statar[stn_ix].kmp
      stat = statar[stn_ix].name
      max_batch = btsqar[0].size - 1
      batch = 0
#     Calculate the linefill between stations.
      while stn_ix < statar.count - 1
        stat = statar[stn_ix].name
        kmp = statar[stn_ix].kmp
        vol = volmar.interpolate_y(kmp)
        kmp_end = statar[stn_ix + 1].kmp
        vol_end = volmar.interpolate_y(kmp_end)        
#       Position initial batch out of the station after shifting the sequence by the sum of the initial_volume setting and the total pumped volume at that station
        upstream_batch = batch
        volume_shift = statar[stn_ix].initial_volume + statar[stn_ix].pumped_volume
        upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift , stn_ix)
        batch = downstream_batch
        commodity_id = btsqar[stn_ix][downstream_batch].commodity_id
        batch_vol = downstream_vol
#       Walk down the line to the next station, adding a new linefill record at each batch interface point
        while kmp < kmp_end
            next_vol1 = vol + batch_vol
            if (vol_end - next_vol1) > 0 then
#             Don't record sliver batches
              if batch_vol > 0.01 then
                lf << Linefillrec.new(kmp, stat, batch, commodity_id, batch_vol, upstream_batch)
                vol = next_vol1
              end
              kmp = volmar.interpolate_x(vol)
              batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'down')
            elsif (vol_end - next_vol1) <= 0 then
              batch_vol = batch_vol - (next_vol1 - vol_end)
#             Don't record sliver batches
              if batch_vol > 0.01 then
                lf << Linefillrec.new(kmp, stat, batch, commodity_id, batch_vol, upstream_batch)
              end
              kmp = kmp_end
            end
        end            
        stn_ix = stn_ix + 1
      end
      return lf
    end


    def step_shift_volumes(statar, btsqar, flowar)
#     Determine volume to the next batch interface out of station or coming into the next downstream station
#     Will need to update this in the future to check for batches hitting elevation change and segment change points as well
      stn_ix = 0
      time_shift = 999999.0
      all_done = false
      step_events = Array.new
#     Initialize the event record so that schedule information can be captured
      event_station = 0
      event_batch = 0
      event_activity = ""
#     Loop through all stations, looking for the next event
      while stn_ix < statar.count - 1
        kmp = statar[stn_ix].kmp
        stat = statar[stn_ix].name
        flow = flowar.get_y(kmp)
#       Get the volume to the next batch at the station
        volume_shift = statar[stn_ix].initial_volume + statar[stn_ix].pumped_volume
        batch1, vol1, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix)
#       Get the volume to the next batch coming into the downstream station
        volume_shift = statar[stn_ix].initial_volume - statar[stn_ix].pipe_volume + statar[stn_ix].pumped_volume
        batch2, vol2, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix)
#       Calculate the time to next batch interface between this station and the next.
        if flow > 0 then
          time_step = [vol1, vol2].min / flow
        else
          time_step = 999999.0
        end
        if time_step < time_shift then
          time_shift = time_step
          event_station = stn_ix
          if vol1 < vol2 then
            event_station = stn_ix
            event_batch = batch1
          else
            event_station = stn_ix + 1
            event_batch = batch2
          end
        end
        stn_ix = stn_ix + 1
      end
      if not all_done then
#       Record the start and end times of the event in btsqar for the schedule.  The end_time has been determined from above code.  The start_time for the next batch in the sequence can therefore also be set.
#       Set start time of the first batch out of the first station
        if $step == 1
          btsqar[0][0].start_time = $timestamp
        end
#       Set the end_time of the event
        btsqar[event_station][event_batch].end_time = $timestamp + time_shift
#       Also set the start_time for the next batch in the sequence and also check if we have reached the end of the batch sequence and are all done.
        if event_batch == btsqar[0].count-1 then event_batch = 0 else event_batch = event_batch + 1 end
        if event_station == 0 and event_batch == btsqar[0].count-1 then
          all_done = true
        else
          btsqar[event_station][event_batch].start_time = $timestamp + time_shift
        end
#       If this is a zero volume batch then set the end time equal to the start time.  Also set the start time of the subsquent batch equal to the end time.
        if event_station != statar.count - 1 then
          while btsqar[event_station][event_batch].volume == 0
            zero_volume_event_time = btsqar[event_station][event_batch].start_time
            btsqar[event_station][event_batch].end_time = zero_volume_event_time
            if event_batch == btsqar[0].count-1 then event_batch = 0 else event_batch = event_batch + 1 end
            btsqar[event_station][event_batch].start_time = zero_volume_event_time
          end
        end
#       Update the pumped volumes for all stations to advance to the next step
        stn_ix = 0
        $timestamp = $timestamp + time_shift
        while stn_ix < statar.count - 1
          if statar[stn_ix].pumped_volume < statar[stn_ix].sequence_volume then
            kmp = statar[stn_ix].kmp
            flow = flowar.get_y(kmp)
            pumped_vol_increment = flow * time_shift
            next_vol = statar[stn_ix].pumped_volume + pumped_vol_increment
            if next_vol > statar[stn_ix].sequence_volume then
              next_vol = statar[stn_ix].sequence_volume
            end        
            statar[stn_ix].pumped_volume = statar[stn_ix].pumped_volume + pumped_vol_increment
          end
          stn_ix = stn_ix + 1
        end
      end
#     Ensure to update the timestamp on the last step of the run.
      if all_done then
        $timestamp = $timestamp + time_shift
      end
      return all_done, time_shift
    end        

    def get_next_batch(btsqar, stn_ix, batch, direction)
      max_batch = btsqar[0].count - 1
      if direction == 'down' then
        if batch > 0 then batch = batch-1 else batch = max_batch end
        while btsqar[stn_ix][batch].volume == 0
          if batch > 0 then batch = batch-1 else batch = max_batch end
        end
      elsif direction == 'up'
        if batch < max_batch then batch = batch+1 else batch = 0 end
        while btsqar[stn_ix][batch].volume == 0
          if batch < max_batch then batch = batch+1 else batch = 0 end
        end
      end        
      commodity_id = btsqar[stn_ix][batch].commodity_id
      batch_vol = btsqar[stn_ix][batch].volume
      return batch, commodity_id, batch_vol
    end

    def get_batch_split(btsqar, volume_shift, stn_ix)
#     if volume_shift is positive we are shifting the volumes forward in time, thus the batch numbers are incremented.
#     if volume_shift is negative we are shifting the volumes backward in time, or further downstream is other way of looking at it, thus batch numbers are decremented.
      if volume_shift >= 0 then
        batch = 0
      else
        batch = btsqar[0].count - 1
      end
      batch_vol = btsqar[stn_ix][batch].volume
      commodity_id = btsqar[stn_ix][batch].commodity_id
      vol = volume_shift.abs
      while vol - batch_vol > 0.0
        vol = vol - batch_vol
        if volume_shift >= 0 then
          batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'up')
        else
          batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'down')
        end
      end
#     After shifting through the batch sequence, determine upstream and downstream volumes based on amount of shifting left over.
      if volume_shift >= 0 then
        downstream_vol = vol
        upstream_vol = batch_vol - vol
      else
        upstream_vol = vol
        downstream_vol = batch_vol - vol
      end      
      upstream_batch = batch
      downstream_batch = batch    
#     If upstream volume is zero, loop until find a non-zero batch
      while upstream_vol <= 0.0000001
        if volume_shift >= 0 then
          batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'up')
        else
          batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'down')
        end
        upstream_batch = batch
        upstream_vol = batch_vol
      end      
#     If downstream volume is zero, loop until find a non-zero batch
      while downstream_vol <= 0.0000001
        if volume_shift >= 0 then
          batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'up')
        else
          batch, commodity_id, batch_vol = get_next_batch(btsqar, stn_ix, batch, 'down')
        end
        downstream_batch = batch
        downstream_vol = batch_vol
      end
      if upstream_vol <= 0.0000001 then
        self.errors.add(:base, "Failure of get_batch_split: #{$step} #{stn_ix} #{upstream_batch} #{upstream_vol} #{downstream_batch} #{downstream_vol}")
        printf("Failure of get_batch_split: %5d  %3d  %3d  %8.2f  %3d  %8.2f \n", $step, stn_ix, upstream_batch, upstream_vol, downstream_batch, downstream_vol)
        exit
      end
      return upstream_batch, upstream_vol, downstream_batch, downstream_vol
    end

    def calc_rate_ratios(statar, btsqar)
#   Calculate rate ratios for the new step
      rr = Array.new(statar.count)
      max_stn_ix = statar.count - 1
      rr[0] = 1
      rr[max_stn_ix] = 0
#     Loop from end of line to beginning, checking for deliveries
      stn_ix = max_stn_ix - 1
      while stn_ix > 0
        stat = statar[stn_ix].name
        kmp = statar[stn_ix].kmp
#       Delivery check:  If the total btsqar volume of the batch going into a station is zero on the other side of the station.
        volume_shift = statar[stn_ix - 1].initial_volume + statar[stn_ix - 1].pumped_volume - statar[stn_ix - 1].pipe_volume
        upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix - 1)
        batch = upstream_batch
        volume = btsqar[stn_ix][batch].volume
        if volume == 0 then rr[stn_ix] = 0 else rr[stn_ix] = 1 end
        stn_ix = stn_ix - 1
      end
#     Loop from beginning of line to end, checking for injections
      stn_ix = 0
      while stn_ix < max_stn_ix - 1
        stat = statar[stn_ix].name
        kmp = statar[stn_ix].kmp      
#       Injection check:  If the total btsqar volume of the batch leaving a station is zero on the upstream side of the station.
        volume_shift = statar[stn_ix + 1].initial_volume + statar[stn_ix + 1].pumped_volume
        upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix + 1)
        batch = upstream_batch
        volume = btsqar[stn_ix][batch].volume
        if volume == 0 then rr[stn_ix + 1] = 100 end
        stn_ix = stn_ix + 1
      end
#     Set all rate ratios to zero downstream of a full stream delivery
      rr_ix = 0
      delivery_happening = false
      while rr_ix < rr.count
        if rr[rr_ix] == 0 then delivery_happening = true end
        if delivery_happening then rr[rr_ix] = 0.0 end
        rr_ix = rr_ix + 1
      end
#     Set all rate ratios to zero upstream of a full stream injection
      rr_ix = rr.count - 1
      injection_happening = false
      while rr_ix >= 0
        if injection_happening then rr[rr_ix] = 0.0 end
        if rr[rr_ix] == 100 then
          injection_happening = true
          rr[rr_ix] = 1
        end
        rr_ix = rr_ix - 1
      end
#     Form the array of rate ratio records to return
      rr_rec_array = Array.new
      stn_ix = 0
      while stn_ix < max_stn_ix
        kmp = statar[stn_ix].kmp
        stat = statar[stn_ix].name
        rr_rec_array << Raterec.new(kmp, stat, rr[stn_ix])
        stn_ix = stn_ix + 1
      end      
      return rr_rec_array
    end
                    
    def calc_flowrates(maxflow, ratear)
      flowar = Profile.new
      stn_ix = 0
      while stn_ix < statar.count - 1
        stat = statar[stn_ix].name
        kmp = statar[stn_ix].kmp
        flow = maxflow * ratear[stn_ix].rate_ratio
        flowar.add_point(kmp, flow)
        stn_ix = stn_ix + 1
      end
      return flowar
    end     

    def adjust_flow(flow, prev_flow, prev_viol, iter, steprecs)
#   Find the max minimum pressure violation on current iteration (the worst violation of minimum pressure)
      stn_ix = 0
      max_viol = -9.0e9
      while stn_ix < steprecs.count - 1
        if steprecs[stn_ix].min_pressure_violation > max_viol then
          max_viol = steprecs[stn_ix].min_pressure_violation
        end
        stn_ix = stn_ix + 1
      end
#     Check if we need to change the flowrate
      if max_viol.abs < 10.0 then
        new_flow = flow
        iterdone = true
      else
#       Adjust the flowrate up or down depending on the pressure violation amount
        if iter == 1 then
          if max_viol < 0 then
            new_flow = flow * 1.10
          else
            new_flow = flow * 0.90
          end
        else
          x1 = prev_flow
          y1 = prev_viol
          x2 = flow
          y2 = max_viol
          if (x1==x2) or (y1==y2) then
            new_flow = x2
          else
            m = (y2-y1)/(x2-x1)
            b = y1 - m*x1
            new_flow = -b/m
          end
        end
        if new_flow < 0 then
          new_flow = 0
        end
        if iter > 20 then
          self.errors.add(:base, "flowrate iterations stopped at 20.  Cannot converge on a flowrate in step #{$step}")
          iterdone = true
        else
          iterdone = false
        end
      end
      return new_flow, max_viol, iterdone
    end

      
    def visc_profile(lfill, tempar)
#   Purpose is to compute the viscosity profile adjusted for temperature of the commodity in the line.
      vp = Profile.new
      kmp = lfill.first.kmp     
      while kmp != nil
        commodity_id = get_record(lfill, kmp).commodity_id
        @commodity = @commodities.detect{ |c| c.commodity_id == commodity_id }
        acoef = @commodity.acoef
        bcoef = @commodity.bcoef
        temp = tempar.get_y(kmp)
        visc = visc_corr(acoef, bcoef, temp)
        vp.add_point(kmp, visc)
        kmp = [next_record(lfill, kmp), tempar.next_x(kmp)].compact.min
      end
      return vp
    end
    
    def xval(e)
      xval = -1.47 - 1.84*e - 0.51*e**2
    end
    
    def visc_corr(acoef, bcoef, temp)
#   Purpose is to adjust the viscosity of an oil for tempeature using the ASTM method.
      err = 2.5e-5
      orest = visc_est(acoef, bcoef, temp)
      diff = 10000
      if xval(orest) < -38.0 then
        return orest
      else
        diff = 10000
        estim = orest
        while diff > err
          tvisc = orest - Math::E**xval(estim)
          diff = (estim - tvisc).abs
          estim = tvisc
        end
        return tvisc
      end
    end

    def visc_est(acoef, bcoef, temp)
#   Purpose is to evalute the initial estimate to viscosity at a specified temperature
      return 10**(10**(acoef - bcoef * Math.log10(temp+273.15))) - 0.7
    end
        
  def dens_profile(lfill, tempar)
#   Calculate the density profile from the densities of the commodities in the line adjusted for temperature in the line.
    dp = Profile.new
    kmp = lfill.first.kmp
    while kmp != nil
      commodity_id = get_record(lfill, kmp).commodity_id
      @commodity = @commodities.detect{ |c| c.commodity_id == commodity_id }
      dn15 = @commodity.density
      dncf = @commodity.density_cf
      temp = tempar.get_y(kmp)
      dens = dn15 * dncf**(temp-15.0)
      dp.add_point(kmp, dens)
      kmp = [next_record(lfill, kmp), tempar.next_x(kmp)].compact.min
     end
    return dp
  end
       
  def static_loss(densar, elevar)
#   Calculate the static pressure profile (pressure loss/gain due to elevation changes)
    sl = Profile.new
    kmp = densar.first.kmp
    while kmp != nil
      dens = densar.get_y(kmp)
      elev = elevar.interpolate_y(kmp)
      next_kmp = [densar.next_x(kmp), elevar.next_x(kmp)].compact.min
      if next_kmp != nil then
        dist = next_kmp - kmp
        next_elev = elevar.interpolate_y(next_kmp)
        slope = (next_elev - elev)/dist
      else
        slope = 0
      end
      sloss = dens * $Gconstant * slope
      sl.add_point(kmp,sloss)
      kmp = next_kmp
    end
    return sl
  end

  def dynamic_loss(flowar, segmar, viscar, densar)
# Calculate the dynamic pressure loss profile (profile of pressure loss due to flowrate friction in pipe)
    dl = Profile.new
    kmp = flowar.first.kmp
    while kmp != nil
      flow = flowar.get_y(kmp)
      segm = get_record(@segmar, kmp)
      diam = segm.diameter
      thick = segm.thickness
      ruff = segm.roughness
      visc = viscar.get_y(kmp)
      dens = densar.get_y(kmp)
      dloss = cole_loss(flow, visc, dens, diam, thick, ruff)
      dl.add_point(kmp,dloss)
      kmp = [flowar.next_x(kmp), next_record(@segmar,kmp), viscar.next_x(kmp), densar.next_x(kmp)].compact.min
    end
    return dl
  end

  def min_press(lfill)
#  Calculate the minimum pressure profile (determine by vapor pressure of commodity in the line)
    mp = Profile.new
    lfill.each do |i|
      kmp = i.kmp
      commodity_id = get_record(lfill, kmp).commodity_id
      @commodity = @commodities.detect{ |c| c.commodity_id == commodity_id }
      vapor_pres = @commodity.vapor
      mp.add_point(kmp, vapor_pres)
    end
    return mp
  end

  def head_calc(statar, statcv, flowar, densar)
    hd = Profile.new
#  Calculate the head generated at each station.
    statar[0...-1].each do |i|
      kmp = i.kmp
      station_flow = flowar.get_y(kmp)
      dens = densar.get_y(kmp)
      station_curve = Profile.new
      statcv.each do |s|
        if i.station_id == s.station_id then
          station_curve << Profile_point.new(s.flow, s.head)
        end
      end
      station_curve.sort_by! {|a| a.flow}
#     Check if any station pumps at this station and set head to zero.
      if station_curve.size > 0 then
  #     Get the head at this station for the current flowrate through it
        if station_flow < station_curve.first.flow then
          pres = $Gconstant * dens * station_curve.first.head
        elsif station_flow > station_curve.last.flow then
          pres = 0.0
        else
          pres = $Gconstant * dens * station_curve.interpolate_y(station_flow)
        end
        hd << Profile_point.new(kmp, pres)
      else
        hd << Profile_point.new(kmp, 0.0)
      end
    end
    return hd
  end
   
  
  def suct_calc(lfill)
#   Calculate the suction pressure profile.  This is set to the vapor pressure of the commodity at stations
#   where there is a full stream injection occurring (start of line and at break out stations)
    sc = Profile.new
    lfill.each do |i|
      kmp = i.kmp
      commodity_id = get_record(lfill, kmp).commodity_id
      @commodity = @commodities.detect{ |c| c.commodity_id == commodity_id }
      vapor_press = @commodity.vapor
      sc.add_point(kmp, vapor_press)
    end
    return sc
  end

  def loss_calc(station, disp, statar, slossar, dlossar, maxpressar, minpressar)
#   Purpose of this method is to compute the total static and dynamic pressure losses between two stations.
#   It also computes the maximum and minimum pressure points on the line between the two stations.
    station_rec = statar.detect { |s| s.name == station}
    kmp = station_rec.kmp
    next_stn_kmp = next_record(statar, kmp)
    telos = 0; tdlos = 0; viol = 0
    maxp_at_station = maxpressar.get_y(kmp)
    pres = disp
    maxp = maxp_at_station
    minp = minpressar.get_y(kmp)
    mxpt = kmp
    mnpt = kmp
    mxvl = pres - maxp
    mnvl = minp - pres
    if station == statar.last.name then
      mxdp=0; mnvl=0; mnpt=kmp; mxvl=0; mxpt=kmp; telos=0; tdlos=0
    else
      while kmp < next_stn_kmp
        sloss = slossar.get_y(kmp)
        dloss = dlossar.get_y(kmp)
        maxp = maxpressar.get_y(kmp)
        minp = minpressar.get_y(kmp)
        prev_kmp = kmp
        kmp = [next_record(statar,kmp), slossar.next_x(kmp), dlossar.next_x(kmp), maxpressar.next_x(kmp), minpressar.next_x(kmp)].compact.min
        dist = kmp - prev_kmp
        pres = pres - dist*(sloss + dloss)
        telos = telos + sloss*dist
        tdlos = tdlos + dloss*dist
        mxdf = pres - maxp
        mndf = minp - pres
        if mxdf >= mxvl then 
          mxpt = kmp
          mxvl = mxdf
        end
        if mndf > mnvl then
          mnpt = kmp
          mnvl = mndf
        end
      end
    end
    mxdp = disp - mxvl
    return mxdp, mnvl, mnpt, mxvl, mxpt, telos, tdlos
  end

  def step_calc(statar, flowar, btsqar, suctar, headar, slossar, dlossar, maxpressar, minpressar)
    kmp = statar[0].kmp
    pres = suctar.get_y(kmp)
    steprecs = Array.new
    statar.each_with_index do |i, stn_ix|
      stat = i.name
      station_id = i.station_id
      kmp = i.kmp
      hold = pres
      flow = flowar.get_y(kmp)
      suct=0; head=0; casep=0; disc=0; telos=0; tdlos=0; mxpt=0; mnpt=0; mxvl=0; mnvl=0; viol=0
      if stn_ix > 0 then up_stn_ix = stn_ix - 1 else up_stn_ix = stn_ix end
      if kmp != statar.last.kmp then
#       Get batch coming into station on upstream side
        if stn_ix > 0 then          
          volume_shift = statar[stn_ix - 1].initial_volume - statar[stn_ix - 1].pipe_volume + statar[stn_ix - 1].pumped_volume
          upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix - 1)
          if upstream_vol < 0.0000001 then
            self.errors.add(:base, "step_calc error: upstream volume < 0.0000001  step:#{$step}  stn:#{stn_ix}  upstream_vol:#{upstream_vol}")
          end
          upstream_batch_id = btsqar[stn_ix - 1][upstream_batch].batch_id
          upstream_batch_str = upstream_batch_id + "  " + upstream_vol.round(2).to_s
        else
          volume_shift = statar[stn_ix].initial_volume + statar[stn_ix].pumped_volume
          upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix)
          upstream_batch_id = btsqar[stn_ix][upstream_batch].batch_id
          upstream_batch_str = " "   #no upstream batch for first station in the line
        end         
#       Get batch leaving station on downstream side
        volume_shift = i.initial_volume + i.pumped_volume
        upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix)
        downstream_batch_id = btsqar[stn_ix][downstream_batch].batch_id
        downstream_batch_str = downstream_batch_id + "  " + downstream_vol.round(2).to_s  
#       Calculate the pressures for this station
        suct = hold
        head = headar.get_y(kmp)
        pres = pres + head
#       If the line is shut down downstream of this station then set the head to zero and the case to same as the holding pressure.
#       If line is shut down, set the discharge to be what the pumps would have otherwise be putting out as line is still pressurized.
#       When line is shut down, the pumps at the station are not running but the line downstream is still pressurized from the previous steps.
        if flow == 0 then
          casep = hold
          disp = pres
          head = 0
        else          
          casep = pres
          disp = casep
        end
#       Calculate values for:
#       mxdp = max discharge pressure
#       mnvl = minimum pressure violation (amount going below minimum suction or vapor pressure at some point between the two stations)
#       mnpt = point of minimum pressure between the two stations
#       mxvl = maximum pressure violation (going over the max allowed working pressure of the pipe at some point between the two stations)
#       mxpt = point of maximum pressure between the two stations
#       telos = total static pressure loss (pressure loss due to elevation change)
#       tdlos = total dynamic pressure loss (pressure loss due to internal pipe friction)
        mxdp, mnvl, mnpt, mxvl, mxpt, telos, tdlos = loss_calc(stat, disp, statar, slossar, dlossar, maxpressar, minpressar)
#       If the discharge pressure has to be reduced due to max pressure violation, then any minimum pressure violation must increase accordingly and the max violation is reset to 0.
        if pres > mxdp then 
          mnvl = mnvl + (pres - mxdp)
          mxvl = 0
          pres = mxdp
        end
        disc = pres
        pres = pres - telos - tdlos
      else
#       Get upstream batch information for batch coming into last station on the line.
        volume_shift = statar[stn_ix - 1].initial_volume - statar[stn_ix - 1].pipe_volume + statar[stn_ix - 1].pumped_volume
        upstream_batch, upstream_vol, downstream_batch, downstream_vol = get_batch_split(btsqar, volume_shift, stn_ix - 1)
        upstream_batch_id = btsqar[stn_ix - 1][upstream_batch].batch_id
        upstream_batch_str = upstream_batch_id + "  " + upstream_vol.round(2).to_s
        flow = 0
        pumped_volume = 0
      end
#     Calculate the Hydraulic Horsepower (HHP) at the station
      if casep-suct > 0 then
        hhp = flow * (casep - suct) / 3600
      else
        hhp = 0
      end
#     Save step result record
      steprecs << Steprec.new($step, $timestamp, 0, kmp, stat, station_id, flow, i.pumped_volume, \
                              upstream_batch_str, downstream_batch_str, hold, suct, head, casep, \
                              disc, mxdp, mnvl, mnpt, mxvl, mxpt, telos, tdlos, hhp, [])
    end
    return steprecs
  end


  def summary_results_calc(results)
#   Get the list of stations from the saved step results.  @results is the only data available at this point.
    stations = results.map {|s| [s.station_id, s.kmp, s.stat]}.uniq
    stations.sort_by! {|s| s[1]}
#   Find the bottleneck points for each step on the line
    bottlenecks = Array[$maxsteps]
    step_ix = 0
    while step_ix <= $maxsteps-1
      max_viol = -9e9
      bottleneck_station = "  "
      results.select {|s| s.step - 1 == step_ix}.each do |r|
        if (r.stat != stations.last[2]) and (r.min_pressure_violation > max_viol) then
          bottleneck_station = r.stat
          max_viol = r.min_pressure_violation
        end
      end
      bottlenecks[step_ix] = bottleneck_station
      step_ix = step_ix + 1
    end
    summary_results = Array.new    
#   Calculate the totals and averages for each station across all steps
    stations.each do |i|
      station_id = i[0]
      kmp = i[1]
      stat = i[2]
      total_time = 0
      accum_volume = 0
      accum_hold = 0
      accum_suct = 0
      accum_head = 0
      accum_casep = 0
      accum_disc = 0
      total_kwh = 0
      bottleneck_time = 0
      station_step_results = results.select {|s| s.stat == stat}
      station_step_results[0...-1].each do |s|
        step = s.step
        steptime = s.step_time
        accum_volume = accum_volume + s.flow*steptime
        accum_hold = accum_hold + s.hold*steptime
        accum_suct = accum_suct + s.suct*steptime
        accum_head = accum_head + s.head*steptime
        accum_casep = accum_casep + s.casep*steptime
        accum_disc = accum_disc + s.disc*steptime
        total_kwh = total_kwh + s.hhp * steptime
        if bottlenecks[step - 1] == stat then
          bottleneck_time = bottleneck_time + steptime
        end
        total_time = total_time + steptime
      end
      bottleneck_pct = 100.0 * bottleneck_time / total_time
      total_pumped = accum_volume.round(0)
      avg_flow = total_pumped / total_time
      avg_hold =  accum_hold / total_time
      avg_suct = accum_suct / total_time
      avg_head = accum_head / total_time
      avg_casep = accum_casep / total_time
      avg_disc = accum_disc / total_time
      summary_results << Sumresultrec.new(stat, station_id, avg_flow, total_pumped, avg_hold, avg_suct, avg_head, avg_casep, avg_disc, bottleneck_pct, total_kwh)
    end
    return summary_results
  end

        
  def save_results
    @results = Array.new
    @stepar.each do |s|
        result = Result.new
        station = @pipeline.stations.find{|i| i.name == s.stat}        
        result.simulation_id = self.id
        result.simulation_name = self.name
        result.step = s.step
        result.timestamp = s.timestamp
        result.step_time = s.step_time
        result.kmp = s.kmp
        result.station_id = station.id
        result.stat = s.stat
        result.flow = s.flow
        result.pumped_volume = s.pumped_volume
        result.upstream_batch = s.upstream_batch
        result.downstream_batch = s.downstream_batch
        result.hold = s.hold
        result.suct = s.suct
        result.head = s.head
        result.casep = s.casep
        result.disc = s.disc
        result.max_disc_pressure = s.max_disc_pressure
        result.min_pressure_violation = s.min_pressure_violation
        result.min_pressure_point = s.min_pressure_point
        result.max_pressure_violation = s.max_pressure_violation
        result.max_pressure_point = s.max_pressure_point
        result.total_static_loss = s.total_static_loss
        result.total_dynamic_loss = s.total_dynamic_loss
        result.hhp = s.hhp
        result.linefill = s.linefill
#       The station curves only need to be stored once (for step 1) as they don't change from step to step
#       The batch squence also only needs to be stored once (for step 1) as it doesn't change from step to step
        if s.step == 1 then
          station_curve = statcv.select {|c| c.station_id == s.station_id}
          result.station_curve_data = station_curve
          stn_ix = @statar.index {|i| i.name == s.stat}
          result.batch_sequence_data = btsqar[stn_ix]
        end
        @results << result
    end
    Result.import @results, validate: false
  end
      

  def get_record(record_array, kmp)
    i = 0
    until i == record_array.count - 1
      if record_array[i].kmp > kmp then break end
      i = i + 1
    end
    i = i - 1
    return record_array[i]
  end
  
    
  def next_record (record_array, kmp)
# Find the next point in a record array
    np = nil
    record_array.each do |i|
      if i.kmp > kmp then
        np = i.kmp
        break
      end
    end
    return np
  end   
  
end

class Profile < Array

  def add_point (x, y)
# Add a profile point to a profile array
    self << Profile_point.new(x,y)
  end

  def next_x (x)
# Find the x point of the next in line profile point
    np = nil
    self.each do |i|
      if i.x > x then
        np = i.x
        break
      end
    end
    return np
  end
  
  def get_y (x)
# Get the y value of a profile array at a specified x point.
    y = nil
    self.each do |i|
      if i.x <= x then
        y = i.y
      else
        break
      end
    end
    return y
  end  

  def get_x (y)
# Get the x of a profile array for a specified y value (e.g. station array)
    x = nil
    self.each do |i|
      if i.y == y
        x = i.x
        break
      end
    end
    return x
  end 

  def interpolate_y (x)
# Use linear interpolation to get the value of a x point within a profile array (e.g. elevations)
    i = 0
    while i < self.count
      x1 = self[i].x
      if i < self.count-1
        x2 = self[i+1].x
        if x>=x1 and x<x2 then
          y1 = self[i].y
          y2 = self[i+1].y
          deltax = x1 - x2
          deltay = y1 - y2
          y = y1  + (x - x1)*deltay/deltax
          break
        end
      elsif i >= self.count-1
        y = self[i].y
        break
      end
      i = i + 1
    end
    return y
  end

  def interpolate_x (y)
    if y < self.map {|t| t.y}.min then
      x = self.first.x
    elsif y > self.map {|t| t.y}.max then
      x = self.last.x
    else
      match = false
      self[0...-1].each_with_index do |i, ix|
        y1 = self[ix].y
        y2 = self[ix+1].y
        if (y >= y1 and y <= y2) or (y <= y1 and y >= y2) then
          x1 = self[ix].x
          x2 = self[ix+1].x
          deltax = x1 - x2
          deltay = y1 - y2
          x = x1 + (y - y1)*deltax/deltay
          match = true
        end
      end
    end
    return x
  end      
    
end


class Profile_point
  attr_accessor :x
  attr_accessor :y
  alias :kmp :x
  alias :val :y
  alias :flow :x
  alias :head :y
  def initialize (x, y)
    @x = x
    @y = y
  end
end  

class Statrec
  attr_accessor :station_id
  attr_accessor :kmp
  attr_accessor :name
  attr_accessor :pipe_volume
  attr_accessor :sequence_volume
  attr_accessor :initial_volume
  attr_accessor :pumped_volume
  def initialize(station_id, kmp, name, pipe_volume, sequence_volume, initial_volume, pumped_volume)
    @station_id = station_id
    @kmp = kmp
    @name = name
    @pipe_volume = pipe_volume
    @sequence_volume = sequence_volume
    @initial_volume = initial_volume
    @pumped_volume = pumped_volume
  end
end


class Steprec
  attr_accessor :step
  attr_accessor :timestamp
  attr_accessor :step_time
  attr_accessor :kmp
  attr_accessor :stat
  attr_accessor :station_id
  attr_accessor :flow
  attr_accessor :pumped_volume
  attr_accessor :upstream_batch
  attr_accessor :downstream_batch
  attr_accessor :hold
  attr_accessor :suct
  attr_accessor :head
  attr_accessor :casep
  attr_accessor :disc
  attr_accessor :max_disc_pressure
  attr_accessor :min_pressure_violation
  attr_accessor :min_pressure_point
  attr_accessor :max_pressure_violation
  attr_accessor :max_pressure_point
  attr_accessor :total_static_loss
  attr_accessor :total_dynamic_loss
  attr_accessor :hhp
  attr_accessor :linefill
  def initialize (step, timestamp, step_time, kmp, stat, station_id, flow, pumped_volume, \
                  upstream_batch, downstream_batch, hold, suct, head, casep, disc, max_disc_pressure, min_pressure_violation, \
                  min_pressure_point, max_pressure_violation, max_pressure_point, total_static_loss, total_dynamic_loss, hhp, linefill)
    @step = step
    @timestamp = timestamp
    @step_time = step_time
    @kmp = kmp
    @stat = stat
    @station_id = station_id
    @flow = flow
    @pumped_volume = pumped_volume
    @upstream_batch = upstream_batch
    @downstream_batch = downstream_batch
    @hold = hold
    @suct = suct
    @head = head
    @casep = casep
    @disc = disc
    @max_disc_pressure = max_disc_pressure
    @min_pressure_violation = min_pressure_violation
    @min_pressure_point = min_pressure_point
    @max_pressure_violation = max_pressure_violation
    @max_pressure_point = max_pressure_point
    @total_static_loss = total_static_loss
    @total_dynamic_loss = total_dynamic_loss
    @hhp = hhp
    @linefill = linefill
  end
end


class Sumresultrec
  attr_accessor :stat
  attr_accessor :station_id
  attr_accessor :flow
  attr_accessor :pumped_volume
  attr_accessor :hold
  attr_accessor :suct
  attr_accessor :head
  attr_accessor :casep
  attr_accessor :disc
  attr_accessor :bottleneck_pct
  attr_accessor :kwh
  def initialize(stat, station_id, flow, pumped_volume, hold, suct, head, casep, disc, bottleneck_pct, kwh)
    @stat = stat
    @station_id = station_id
    @flow = flow
    @pumped_volume = pumped_volume
    @hold = hold
    @suct = suct
    @head = head
    @casep = casep
    @disc = disc
    @bottleneck_pct = bottleneck_pct
    @kwh = kwh
  end
end

class Linefillrec
  attr_accessor :kmp
  attr_accessor :stat
  attr_accessor :batch
  attr_accessor :commodity_id
  attr_accessor :batch_vol
  attr_accessor :upstream_batch
  def initialize(kmp, stat, batch, commodity_id, batch_vol, upstream_batch)
    @kmp = kmp
    @stat = stat
    @batch = batch
    @commodity_id = commodity_id
    @batch_vol = batch_vol
    @upstream_batch = upstream_batch
  end
end

class Raterec
  attr_accessor :kmp
  attr_accessor :stat
  attr_accessor :rate_ratio
  def initialize (kmp, stat, rate_ratio)
    @kmp = kmp
    @stat = stat
    @rate_ratio = rate_ratio
  end
end
  
class Batchrec
  attr_accessor :batch_id
  attr_accessor :batch_number
  attr_accessor :commodity_id
  attr_accessor :volume
  attr_accessor :start_location
  attr_accessor :end_location
  attr_accessor :start_time
  attr_accessor :end_time
  attr_accessor :activity_type
  attr_accessor :shipper
  attr_accessor :shipment_number
  def initialize (batch_number, commodity_id, volume, start_location, end_location, start_time, end_time, activity_type, shipper, shipment_number)
    @batch_number = batch_number
    @commodity_id = commodity_id
    @volume = volume
    @start_location = start_location
    @end_location = end_location
    @start_time = start_time
    @end_time = end_time
    @activity_type = activity_type
    @shipper = shipper
    @shipment_number = shipment_number
  end
end

class Commodityrec
  attr_accessor :commodity_id
  attr_accessor :temp1
  attr_accessor :visc1
  attr_accessor :temp2
  attr_accessor :visc2
  attr_accessor :density
  attr_accessor :density_cf
  attr_accessor :vapor
  def initialize (commodity_id, temp1, visc1, temp2, visc2, density, density_cf, vapor)
    @commodity_id = commodity_id
    @temp1 = temp1
    @visc1 = visc1
    @temp2 = temp2
    @visc2 = visc2
    @density = density
    @density_cf = density_cf
    @vapor = vapor
  end
end

class Stationcurverec
  attr_accessor :station_id
  attr_accessor :station_name
  attr_accessor :flow
  attr_accessor :head
  def initialize (station_id, station_name, flow, head)
    @station_id = station_id
    @station_name = station_name
    @flow = flow
    @head = head
  end
end



