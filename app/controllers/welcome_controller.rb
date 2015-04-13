class WelcomeController < ApplicationController

  def home
  end

  def pre_signin
    if current_user
      redirect_to home_path
    end
  end

  def post_action
    current_event = Event.find_by(:code => params[:SecretCode])

    if current_event != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code then

      Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'pre-event')


    redirect_to survey_path
    else
      flash[:notice] = 'Incorrect event code please try again'
      redirect_to checkin_path
    end
  end

  def checkin
  end

end


