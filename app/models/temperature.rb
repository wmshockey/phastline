class Temperature < ActiveRecord::Base
  belongs_to :pipeline
  validates :kmp, :presence => true, numericality: {:greater_than_or_equal_to => 0}
  validates :temperature, :presence => true, numericality: {:greater_than_or_equal_to => -40, :less_than => 60}
end
