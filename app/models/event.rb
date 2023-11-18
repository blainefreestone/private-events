class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    validates :title, :date_and_time, :location, :description, presence: true
end
