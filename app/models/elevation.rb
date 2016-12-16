class Elevation < ActiveRecord::Base
  belongs_to :pipeline
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :elevation, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 4000}
end
