class Progressbar < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :message
  validates_numericality_of :percent,
  greater_than_or_equal_to: 0,
  less_than_or_equal_to: 100
end
