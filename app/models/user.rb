class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  belongs_to :plan
  has_one :profile

  def self.mentees
    User.joins(:profile, :plan).where("plans.name='mentee' and profiles.not_available=?", false)
  end
  
  def self.mentors
    User.joins(:profile, :plan).where("plans.name='mentor' and profiles.not_available=?", false)
  end
end
