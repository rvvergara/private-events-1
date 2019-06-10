class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    has_many :attendances, foreign_key: :attended_event_id

    has_many :attendees, through: :attendances, source: :attendee

    def past
      self.where("event_date < ?", Time.now.strftime("%Y-%m-%d") ).order(event_date: :desc)
    end

    def coming
      self.where("event_date > ?", Time.now.strftime("%Y-%m-%d") ).order(event_date: :asc)
    end
end
