class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def create
    attended_event = Event.find(params[:attended_event_id])
    @event_attending = current_user.event_attendings.build(attended_event: attended_event)

    if @event_attending.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event_attending = EventAttending.where(attended_event_id: params[:attended_event_id], attendee_id: current_user.id).take
    @event_attending.destroy

    redirect_to root_path, status: :see_other
  end
end
