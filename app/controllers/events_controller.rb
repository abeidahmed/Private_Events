class EventsController < ApplicationController
  def index
    @event = Event.all
    @past_events = Event.past
    @upcoming_event = Event.upcoming_event
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new

    end
  end


end
