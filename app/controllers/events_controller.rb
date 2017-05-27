class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    render layout: false
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    if @event.update(event_params)
      redirect_to events_url, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def show
    render layout: false
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:venue_id, :title, :start_time, :end_time, :event_leaders, :published, :short_description, :description, :attractions, :cost, :inclusions, :exclusions, :payment_details, :itinerary, :assembly_point, :assembly_time, :contact_details, :disclaimer)
    end
end
