class Temperature < ActiveRecord::Base
  belongs_to :pipeline
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :temperature, :presence => true, numericality: {:greater_than_or_equal_to => -60, :less_than_or_equal_to => 60}
  validates_uniqueness_of :kmp, scope: :pipeline_id
  default_scope { order(pipeline_id: :asc, kmp: :asc) }
end
