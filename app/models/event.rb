class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  scope :past, ->{ where('date < ?', Time.zone.now) } 
  scope :upcoming_event, ->{ where('date >= ?', Time.zone.now) } 

  validates :date, presence: true
  validates :details, presence: true
end
