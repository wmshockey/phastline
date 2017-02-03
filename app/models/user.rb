class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pipelines, dependent: :destroy
  has_many :schedules, through: :pipelines, dependent: :destroy
  has_many :nominations, through: :pipelines, dependent: :destroy
  has_many :simulations, dependent: :destroy
  has_many :commodities, dependent: :destroy
  has_many :pumps, dependent: :destroy
end
