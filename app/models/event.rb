class Event < ActiveRecord::Base
  has_many :users, :through => :surveys
  has_many :surveys

end
