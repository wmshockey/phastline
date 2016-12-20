class Nomination < ActiveRecord::Base
    has_many :shipments, dependent: :destroy
    validates :name, :presence => true
    validates :nom_date, :presence => true
    validates :pipeline_name, allow_blank: true, length: { maximum: 512 }
    validates :period, :presence => true, numericality: {:greater_than_or_equal_to => 0,  :less_than => 366}
end
