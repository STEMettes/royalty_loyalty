class WelcomeController < ApplicationController

  def home
  end

  def pre_signin
    if current_user
      redirect_to home_path
    end
  end

  def post_action
    test = Event.find_by(:code => params[:SecretCode])

    if test != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code then

      # Survey.create(:event_id => test.id, :user_id => user_session.id)

    redirect_to survey_path
    else
      flash[:notice] = 'Incorrect event code please try again'
    end
  end

  def checkin
  end

end


