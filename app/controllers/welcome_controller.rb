class WelcomeController < ApplicationController
  # def home
  # end

  def pre_signin
    if current_user
      # redirect_to home_path
    end
  end

  def post_action
    p '---' * 40
    p current_user
    p '*' * 50
    p User.first
    test = Event.find_by(:code => params[:SecretCode])
    if test != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code then
    redirect_to survey_path
    else
      flash[:notice] = 'Incorrect event code please try again'
    end
  end

  # def checkin
  # end

end
