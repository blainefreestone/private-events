class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :title, :date_and_time, :location, :description, presence: true
    has_many :event_attendings, foreign_key: "attended_event"
    has_many :attendees, through: :event_attendings, source: :attendee
end
