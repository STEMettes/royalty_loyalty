class UserController < ApplicationController

  def create
    User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :dob, :email, :username, :county, :admin)
  end

end
