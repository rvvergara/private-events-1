class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  scope :upcoming, -> { where("event_date > ?", Time.now.strftime("%Y-%m-%d") ).order(event_date: :asc) } 
  scope :past, -> { where("event_date < ?", Time.now.strftime("%Y-%m-%d") ).order(event_date: :desc) } 

end
