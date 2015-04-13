class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :events, :through => :surveys
    has_many :surveys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def first_name
    self.name.split[0]
  end

  def add(points)
    self.points += points
  end

end
