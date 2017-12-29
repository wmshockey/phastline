class Pipeline < ActiveRecord::Base
  require 'phast_utilities'
  include Conversions
  belongs_to :user
  has_many :segments, dependent: :destroy
  has_many :stations, dependent: :destroy
  has_many :elevations, dependent: :destroy
  has_many :temperatures, dependent: :destroy
  has_many :dras, dependent: :destroy
  has_many :nominations, dependent: :destroy
  has_many :units, through: :stations
  validates :name, :presence => true
  validates_uniqueness_of :name, scope: :user_id
  default_scope { order(user_id: :asc, name: :asc) }
  before_save :count_number_child_records, on: [:create, :update]

  def count_number_child_records
    # Count number of stations
    station_count = self.stations.count
    if station_count.nil? then
      station_count = 0
    end
    self.number_stations = station_count unless !self.persisted?
    # Count number of segments
    segment_count = self.segments.count
    if segment_count.nil? then
      segment_count = 0
    end
    self.number_segments = segment_count unless !self.persisted?
    # Count number of elevations
    elevation_count = self.elevations.count
    if elevation_count.nil? then
      elevation_count = 0
    end
    self.number_elevations = elevation_count unless !self.persisted?
    # Count number of temperatures
    temperature_count = self.temperatures.count
    if temperature_count.nil? then
      temperature_count = 0
    end
    self.number_temperatures = temperature_count unless !self.persisted?
    # Count number of DRA records
    dra_count = self.dras.count
    if dra_count.nil? then
      dra_count = 0
    end
    self.number_dras = dra_count unless !self.persisted?
  end

  def copy(pipelines, pipeline)
    pipeline_copy = pipeline.dup
    n = 1
    while n <= 100
      new_name = pipeline.name + "-copy" + n.to_s
      if pipelines.find {|s| s.name == new_name} then
        n = n + 1
      else
        break
      end
    end
    pipeline_copy.name = new_name
    pipeline_copy.save
    stations = pipeline.stations
    stations.each do |s|
      s_copy = s.dup
      s_copy.pipeline_id = pipeline_copy.id
      s_copy.save
      units = s.units
      units.each do |u|
        u_copy = u.dup
        u_copy.station_id = s_copy.id
        u_copy.save
      end
    end
    segments = pipeline.segments
    segments.each do |s|
      s_copy = s.dup
      s_copy.pipeline_id = pipeline_copy.id
      s_copy.save
    end
    elevations = pipeline.elevations
    elevations.each do |e|
      e_copy = e.dup
      e_copy.pipeline_id = pipeline_copy.id
      e_copy.save
    end
    temperatures = pipeline.temperatures
    temperatures.each do |t|
      t_copy = t.dup
      t_copy.pipeline_id = pipeline_copy.id
      t_copy.save
    end
    return pipeline_copy
  end

  def get_volumes(segmar)
# Calculate the pipeline volumes to each kmp point into a profile array
# Note that user input for segments must include an entry for the last point on the line.
    volumes = Profile.new
#   Record volume of first kmp on the line as 0
    i = 0
    kmp = segmar[i].kmp
    volumes.add_point(kmp,0)
#   Record volume points for remaining segments on the line
    i = 1
    while i <= segmar.count-1
      kmp = segmar[i].kmp
      diam = segmar[i-1].diameter - 2*segmar[i-1].thickness
      length = kmp - segmar[i-1].kmp
      volm = 1000 * length * Math::PI * (diam/2)**2 + volumes[i-1].val
      volumes.add_point(kmp,volm)
      i = i + 1
    end
    return volumes
  end


  def get_all_temps
# Get all temperatures into a profile array
    temp_profile = Profile.new
    temp_array = temperatures.sort_by { |a| a.kmp}
    temp_array.each do |i|
      kmp = convert_to_si(i.kmp, self.dist_unit)
      temp = convert_to_si(i.temperature, self.temp_unit)      
      temp_profile.add_point(kmp, temp)
    end
    return temp_profile
  end

  def get_all_elevations
# Get all elevations into a profile array
    elev_profile = Profile.new
    elev_array = elevations.sort_by { |a| a.kmp}
    elev_array.each do |i|
      kmp = convert_to_si(i.kmp, self.dist_unit)
      elev = convert_to_si(i.elevation, self.elev_unit)
      elev_profile.add_point(kmp, elev)
    end
    return elev_profile
  end
  
  def get_all_segments
    segmar = Array.new
    segments_sorted = self.segments.sort_by { |a| a.kmp}
    segments_sorted.each do |s|
      id = s.id
      kmp = convert_to_si(s.kmp, self.dist_unit)
      diam = convert_to_si(s.diameter, self.diam_unit)
      thick = convert_to_si(s.thickness, self.thick_unit)
      ruff = convert_to_si(s.roughness, self.ruff_unit)
      mawp = convert_to_si(s.mawp, self.pres_unit)
      segmar << Segmrec.new(id, kmp, diam, thick, ruff, mawp)
    end
    return segmar
  end

  def get_all_dras
# Get all dras into a profile array
    dra_profile = Profile.new
    dra_array = dras.sort_by { |a| a.start_kmp}
    line_start_kmp = elevations[0].kmp
    dra_profile.add_point(line_start_kmp, 0)
    dra_array.each do |i|
      # first delete any previous point with the same kmp (0 value points)
      dra_profile.delete_if {|x| x.kmp == i.start_kmp}
      dra_profile.add_point(i.start_kmp, i.dra_percent)
      dra_profile.add_point(i.end_kmp, 0)
    end
    return dra_profile
  end

  def get_all_stations(volmar)
# Get all stations into a profile array
    stat_records = Array.new
    stat_array = stations.sort_by { |a| a.kmp}
    stn_ix = 0
    max_ix = stat_array.count - 1
    while stn_ix <= max_ix
      start_kmp = convert_to_si(stat_array[stn_ix].kmp, self.dist_unit)
      start_vol = volmar.interpolate_y(start_kmp)
      if stn_ix < max_ix then
        end_kmp = convert_to_si(stat_array[stn_ix + 1].kmp, self.dist_unit)
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
      kmp = convert_to_si(i.kmp, self.dist_unit)
      mawp = convert_to_si(i.mawp, self.pres_unit)
      mp.add_point(kmp, mawp)
    end
    return mp
  end

  def get_station_curves(statar, units, pumpar)
    station_curves = Array.new
    row_curve = Profile.new
    total_row_curve = Profile.new
    new_total_row_curve = Profile.new
    statar[0...-1].each do |i|
      station_units = units.select {|u| u.station_id == i.station_id}
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
            flow_units = pmp.flow_units
            pmp.headpoints.each do |h|
              row_flow_values << convert_to_si(h.flow, flow_units)
            end
          end
          row_flow_values.uniq!
          row_flow_values.sort!
#         Add heads for all units on the same row in series
          row_flow_values.each do |v|
            flow = v
            total_head = 0
            row_units.each_with_index do |u|
#             Get the headpoints for this unit as a Profile array
              unit_head_curve = Profile.new
              pmp = pumpar.find {|p| p.pump_id == u.pump_id}
              flow_units = pmp.flow_units
              head_units = pmp.head_units
              pmp.headpoints.each do |h|
                rate = convert_to_si(h.flow, flow_units)
                head = convert_to_si(h.head, head_units)
                unit_head_curve << Profile_point.new(rate, head)
              end
              unit_head_curve.sort_by! {|t| t.flow}
  #           Check if the flowrate is outside the bounds of this unit's pump curve
              if flow < unit_head_curve.first.flow then
                head = unit_head_curve.first.val
                logger.info "flowrate #{flow} is below first head point for #{pmp.pump_id}, setting head to #{head}"
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
