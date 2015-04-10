class UserController < ApplicationController

  before_action :authenticate_user!, :except => [:index]


  def create
    User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :dob, :email, :username, :county, :admin)
  end

end
