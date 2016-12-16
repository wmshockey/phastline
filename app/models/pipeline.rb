class Pipeline < ActiveRecord::Base
  has_many :segments, dependent: :destroy
  has_many :stations, dependent: :destroy
  has_many :elevations, dependent: :destroy
  has_many :temperatures, dependent: :destroy
  validates :name, :presence => true  

  def get_volumes
# Calculate the pipeline volumes to each kmp point into a profile array
    volumes = Profile.new
    segs_sorted = segments.sort_by {|a| a.kmp}    
    i = 0
    while i <= segs_sorted.count-1
      if i < segs_sorted.count-1       
        kmp = segs_sorted[i].kmp
      elsif i == segs_sorted.count-1
        kmp = stations.last.kmp
      end     
      if i == 0 then
        volumes.add_point(kmp,0)
      else
        diam = segs_sorted[i-1].diameter - 2*segs_sorted[i-1].thickness
        length = kmp - segs_sorted[i-1].kmp
        volm = 1000 * length * Math::PI * (diam/2)**2 + volumes[i-1].val
        volumes.add_point(kmp,volm)
      end
      i = i +1
    end
    return volumes
  end

  def get_all_temps
# Get all temperatures into a profile array
    temp_profile = Profile.new
    temp_array = temperatures.sort_by { |a| a.kmp}
    temp_array.each do |i|
      temp_profile.add_point(i.kmp, i.temperature)
    end
    return temp_profile
  end

  def get_all_elevations
# Get all elevations into a profile array
    elev_profile = Profile.new
    elev_array = elevations.sort_by { |a| a.kmp}
    elev_array.each do |i|
      elev_profile.add_point(i.kmp, i.elevation)
    end
    return elev_profile
  end

  def get_all_stations(volmar)
# Get all stations into a profile array
    stat_records = Array.new
    stat_array = stations.sort_by { |a| a.kmp}
    stn_ix = 0
    max_ix = stat_array.count - 1
    while stn_ix <= max_ix
      start_kmp = stat_array[stn_ix].kmp
      start_vol = volmar.interpolate_y(start_kmp)
      if stn_ix < max_ix then
        end_kmp = stat_array[stn_ix + 1].kmp
        end_vol = volmar.interpolate_y(end_kmp)
        pipe_vol = end_vol - start_vol
      else
        pipe_vol = 0
      end        
      stat_records << Statrec.new(stat_array[stn_ix].id, start_kmp, stat_array[stn_ix].name, pipe_vol, 0.0, 0.0, 0.0)
      stn_ix = stn_ix + 1
    end
    return stat_records
  end

  def get_all_maxpress
#  Get all maximum pressures into a profile array
    mp = Profile.new
    segm_array = segments.sort_by { |a| a.kmp}
    segm_array.each do |i|
      mp.add_point(i.kmp, i.mawp)
    end
    return mp
  end

  def get_station_curves(statar, pumpar)
    station_curves = Array.new
    row_curve = Profile.new
    total_row_curve = Profile.new
    new_total_row_curve = Profile.new
#   Check if there are any pumps on the whole line
    number_of_units = 0
    statar[0...-1].each do |i|
      station_units = Unit.select {|u| u.station_id == i.station_id}
      number_of_units = number_of_units + station_units.size
    end
    if number_of_units == 0 then
      raise "Error - There are no pumping units anywhere on the line."
    end
    statar[0...-1].each do |i|
      station_units = Unit.select {|u| u.station_id == i.station_id}
#     Check if there are any units at this station
      if station_units.size > 0 then
        total_row_curve = Profile.new
        row_list = station_units.map{|t| t.unit_row}.uniq.sort
        row_list.each do |row|
          row_curve = Profile.new
          row_units = station_units.select {|r| r.unit_row == row}      
          row_flow_values = Array.new
#         Get the common flowrate values list
          row_units.each do |u|
            pmp = pumpar.find {|p| p.pump_id == u.pump_id}
            pmp.headpoints.each do |h|
              row_flow_values << h.flow
            end
          end
          row_flow_values.uniq!
          row_flow_values.sort!
          row_flow_values.map! {|e| e * $Gpm_m3hr}
#         Add heads for all units on the same row in series
          row_flow_values.each do |v|
            flow = v
            total_head = 0
            row_units.each_with_index do |u|
#             Get the headpoints for this unit as a Profile array
              unit_head_curve = Profile.new
              pmp = pumpar.find {|p| p.pump_id == u.pump_id}
              pmp.headpoints.each do |h|
                rate = h.flow * $Gpm_m3hr
                head = h.head * $Ft_m
                unit_head_curve << Profile_point.new(rate, head)
              end
              unit_head_curve.sort_by! {|t| t.flow}
  #           Check if the flowrate is outside the bounds of this unit's pump curve
              if flow < unit_head_curve.first.flow then
                head = unit_head_curve.first.val
              elsif flow > unit_head_curve.last.flow
                head = 0.0
              else
                head = unit_head_curve.interpolate_y(flow)
              end
              total_head = total_head + head
            end
            row_curve << Profile_point.new(flow, total_head)
          end      #end of row flow values loop
#         Add flowrates for all rows in parallel
          if total_row_curve.size > 0 then
            row_head_values = row_curve.map {|t| t.val}
            total_row_head_values = total_row_curve.map {|t| t.val}            
            max_pres = [row_head_values.max, total_row_head_values.max].min
            min_pres = [row_head_values.min, total_row_head_values.min].max
#           Combine the curves in parallel only if they share a common range of pressures.
            if min_pres < max_pres then            
              total_row_head_values = (total_row_head_values + row_head_values).uniq.sort
              total_row_head_values = total_row_head_values.select {|t| t >= min_pres and t <= max_pres}
              new_total_row_curve = []
              total_row_head_values.each do |head|
                row_flow = row_curve.interpolate_x(head)
                total_row_flow = total_row_curve.interpolate_x(head) + row_curve.interpolate_x(head)
                new_total_row_curve << Profile_point.new(total_row_flow, head)              
              end
            else
              logger.warn "Warning: Parallel units are incompatible at #{i.name}.  All pumps at this station are turned off."
              new_total_row_curve = []
            end
          else
            new_total_row_curve = row_curve
          end
          total_row_curve = new_total_row_curve            
        end     # end of rows loop
#       Add total row curve to station curves
        total_row_curve.each do |t|
          station_curves << Stationcurverec.new(i.station_id, i.name, t.kmp, t.val)
        end                   
      end    #end of if station has units block
    end    #end of station loop
    station_curves.sort_by! {|e| [e.station_id, e.flow]}
    return station_curves
  end

end

