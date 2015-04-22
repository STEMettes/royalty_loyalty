class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :events, :through => :surveys
    has_many :surveys

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default-profile-pic.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def first_name
    if self.name != nil
      self.name.split[0]
    end
  end

  def add(added_points)
    self.update(:points => self.points += added_points)
  end

end
