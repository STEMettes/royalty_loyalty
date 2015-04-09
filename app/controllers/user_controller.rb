class UserController < ApplicationController


  def create
    byebug
    User.create(user_params)
  end

  def user_params

    params.require(:user).permit(:name, :dob, :email, :username, :county)


  end

end
