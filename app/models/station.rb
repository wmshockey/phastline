class Station < ApplicationRecord
  belongs_to :pipeline
  has_many :units, dependent: :destroy
  has_many :results, dependent: :destroy
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :name, :presence => true
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
