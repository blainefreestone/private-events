class AddRefsToEventAttendings < ActiveRecord::Migration[7.1]
  def change
    add_reference :event_attendings, :attendee, null: false, foreign_key: { to_table: :users }
    add_reference :event_attendings, :attended_event, null: false, foreign_key: { to_table: :events }
  end
end
