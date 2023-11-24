class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @past_events = Event.past
        @future_events = Event.future
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to events_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :date_and_time, :location, :description)
    end
end
