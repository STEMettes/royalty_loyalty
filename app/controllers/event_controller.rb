class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def checkin
    print Event.first.name
  end

end
