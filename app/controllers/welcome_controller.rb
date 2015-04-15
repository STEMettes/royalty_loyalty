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
    survey_count = 0

    if current_event == nil
      flash[:notice] = 'Incorrect event code please try again'
      redirect_to checkin_path
    elsif Date.today > current_event.date
      flash[:notice] = 'Sorry, cannot check in to event before it starts'
      redirect_to checkin_path
    elsif Date.today < current_event.date
      flash[:notice] = 'Sorry, Event has expired'
      redirect_to checkin_path
    elsif
      for i in (0..current_user.surveys.count - 1)
        if current_event.id == current_user.surveys[i].event.id
          survey_count += 1
        end
      end

      if survey_count == 0
        #this automatically creates a survey without the user needing to complete it. Need to call survey.create on the confirmation page
        Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'pre-event')
        redirect_to survey_path
      else
        flash[:notice] = 'You have already checked-in to this event'
        redirect_to checkin_path
      end
    end
  end

  def expired?
    Date.today != Event.first.date
  end

  def checkin
  end


  def post_action_checkout

    current_event = Event.find_by(:code => params[:SecretCode])
    survey_count = 0

    if current_event == nil
      flash[:notice] = 'Incorrect event code please try again'
      redirect_to checkout_path
    else

      for i in (0..current_user.surveys.count - 1)
        if current_event.id == current_user.surveys[i].event.id
          survey_count += 1
        end
      end

      if survey_count == 0
        flash[:notice] = 'You have not yet checked-in to this event'
        redirect_to checkin_path
      elsif survey_count == 1
        Survey.create(:event_id => current_event.id, :user_id => current_user.id, :survey_type => 'post-event')
        redirect_to post_survey_path
      else
        flash[:notice] = 'You have already checked-out of this event'
        redirect_to checkout_path
      end

    end
  end


end
