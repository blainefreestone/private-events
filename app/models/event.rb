class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :title, :date_and_time, :location, :description, presence: true
    has_many :event_attendings, foreign_key: "attended_event"
    has_many :attendees, through: :event_attendings, source: :attendee

    scope :future, -> { where("DATE(date_and_time) > ?", DateTime.now) }
    scope :past, -> { where("DATE(date_and_time) < ?", DateTime.now) }

    # def self.future
    #     Event.all.where("DATE(date_and_time) > ?", DateTime.now)
    # end

    # def self.past
    #     Event.all.where("DATE(date_and_time) < ?", DateTime.now)
    # end
end
