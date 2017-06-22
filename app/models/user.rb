class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pipelines, dependent: :destroy
  has_many :nominations, through: :pipelines, dependent: :destroy
  has_many :simulations, dependent: :destroy
  has_many :commodities, dependent: :destroy
  has_many :pumps, dependent: :destroy
  after_create :populate_seed_data

  def populate_seed_data
    Rails.application.load_seed
  end
  
end
