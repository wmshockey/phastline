class Activity < ActiveRecord::Base
  belongs_to :schedule
  validates :batch_id, :presence => true
  validates :start_time, length: { maximum: 30 }, allow_blank: true
  validates :end_time, length: { maximum: 30 }, allow_blank: true
  validates :activity_type, :presence => true
  validates :volume, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 1000000}
  validates :station, :presence => true
  validates :shipper, length: { maximum: 15 }, allow_blank: true
  validates :nomination_name, length: { maximum: 15 }, allow_blank: true
  default_scope { order('start_time ASC') }
end
