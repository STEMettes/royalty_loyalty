class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def checkin
    print Event.first.name
  #   if Event.find_by(:code => params[:secret_code])

  #   else
  #     flash[:notice] = 'Incorrect event code please try again'
  #   end
  end

end
