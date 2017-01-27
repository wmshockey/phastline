class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pipelines
  has_many :schedules, through: :pipelines
  has_many :nominations, through: :pipelines
  has_many :simulations
  has_many :commodities
  has_many :pumps
end
