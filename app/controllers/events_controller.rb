class EventsController < ApplicationController
  before_action :ensure_login, only: %i[create show]
  def index
    @event = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming_event

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

  def show 
    @event = find(params[:id])
    @created_events = current_user.created_events
  end

  def show 
    @attendance = current_user.attendances.find_or_initialize_by(attendance_params)

    if @attendance.save
      redirect_to root_path

    else
      render :new
    end
  end


end
