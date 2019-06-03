class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attended_events, through: :attendances, source: :attended_event
end
