class WelcomeController < ApplicationController

  def home
    if current_user.admin == true then
      redirect_to rails_admin_path
    end
  end

  def pre_signin
    if current_user
      redirect_to home_path
    end
  end

  def post_action

    current_event = Event.find_by(:code => params[:SecretCode])

    if current_user.surveys.last != nil

      last_event_survey = current_user.surveys.last.event.name

      if current_event != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code && current_event.name != last_event_survey then
        Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'pre-event')
        redirect_to survey_path

      else
        if current_event.name == last_event_survey
          flash[:notice] = 'You have already checked-in to this event'
        else
          flash[:notice] = 'Incorrect event code please try again' 
      end
        redirect_to checkin_path
      end
    
    else

      if current_event != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code
        Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'pre-event')
        redirect_to survey_path

      else
        flash[:notice] = 'Incorrect event code please try again' 
        redirect_to checkin_path
      end
    end
  end

  def checkin
  end


  def post_action_checkout

    current_event = Event.find_by(:code => params[:SecretCode])

    if current_user.surveys.last != nil

      last_event_survey = current_user.surveys.last.event.name

      if current_event != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code && current_event.name != last_event_survey then
        Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'post-event')
        redirect_to survey_path

      else
        if current_event.name == last_event_survey
          flash[:notice] = 'You have already checked-in to this event'
        else
          flash[:notice] = 'Incorrect event code please try again' 
      end
        redirect_to checkin_path
      end
    
    else

      if current_event != nil && params[:SecretCode] == Event.find_by(:code => params[:SecretCode]).code
        Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'pre-event')
        redirect_to survey_path

      else
        flash[:notice] = 'Incorrect event code please try again' 
        redirect_to checkin_path
      end
    end
  end




end
