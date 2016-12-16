class Station < ActiveRecord::Base
  belongs_to :pipeline
  has_many :units, dependent: :destroy
  has_many :results, dependent: :destroy
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :name, :presence => true
  validates :pipeline_id, :presence => true
  default_scope { order('kmp ASC') }  
end
