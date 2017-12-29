class Segment < ActiveRecord::Base
  belongs_to :pipeline
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :diameter, :presence => true, numericality: {:greater_than => 0, :less_than => 10}
  validates :thickness, :presence => true, numericality: {:greater_than => 0, :less_than => 1}
  validates :roughness, :presence => true, numericality: {:greather_than_or_equal_to => 0, :less_than => 0.1}
  validates :mawp, :presence => true, numericality: {:greater_than => 0, :less_than => 100000}
  validates :pipeline_id, :presence => true
  validates_uniqueness_of :kmp, scope: :pipeline_id
  default_scope { order(pipeline_id: :asc, kmp: :asc) }
  after_commit :update_pipeline, on: [:create, :update, :destroy]

  def update_pipeline
    if self.pipeline.persisted?
      self.pipeline.save
      self.pipeline.touch
    end
  end
        
end
