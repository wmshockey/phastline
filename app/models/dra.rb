class Dra < ActiveRecord::Base
  belongs_to :pipeline
  validates :start_kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :end_kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :dra_percent, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  validate  :end_greater_than_start
  validate  :no_overlap
  validate  :within_pipeline
  validates_uniqueness_of :start_kmp, scope: :pipeline_id
  default_scope { order(pipeline_id: :asc, start_kmp: :asc) }

  def end_greater_than_start
      self.errors[:base] << "End kmp of region must be greater than injection start kmp." unless end_kmp > start_kmp
  end
  
  def no_overlap
    pipeline = Pipeline.find(self.pipeline_id)
    dra_regions = pipeline.dras
    start_kmp = self.start_kmp
    end_kmp = self.end_kmp
    if dra_regions.any? then
      dra_regions.each do |d|
        if self.id != d.id then
          if (start_kmp >= d.start_kmp and start_kmp < d.end_kmp) || 
            (end_kmp > d.start_kmp and end_kmp <= d.end_kmp) || 
            (start_kmp <= d.start_kmp and end_kmp >= d.end_kmp) then
            self.errors[:base] << "DRA region overlaps with another DRA region that starts at #{d.start_kmp} and ends at #{d.end_kmp}"
          end
        end
      end
    end      
  end

  def within_pipeline
    pipeline = Pipeline.find(self.pipeline_id)
    stations = pipeline.stations
    line_start_kmp = stations[0].kmp
    line_end_kmp   = stations.last.kmp
    if !( (self.start_kmp >= line_start_kmp) and (self.end_kmp <= line_end_kmp)) then
      self.errors[:base] << "DRA region is not within the start and end points of the pipeline"
    end
  end
  
end
