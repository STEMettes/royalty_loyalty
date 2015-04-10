class WelcomeController < ApplicationController
  def index
  end

  def post_action
    test = Event.find_by(:code => params[:SecretCode])
    if test != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code then
    redirect_to survey_path
    else
      flash[:notice] = 'Incorrect event code please try again'
    end
  end

  def checkin

  end

end


