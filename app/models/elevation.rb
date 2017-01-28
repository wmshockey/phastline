class Elevation < ActiveRecord::Base
  belongs_to :pipeline
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :elevation, :presence => true, numericality: {:greater_than_or_equal_to => -2000, :less_than => 10000}
  default_scope { order(pipeline_id: :asc, kmp: :asc) }
end
