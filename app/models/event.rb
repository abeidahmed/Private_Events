class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_events_id', class_name: 'Attendance'
  has_many :attendees, through: :attendances, source: :attendee

  scope :past, ->{ where('date < ?', Time.zone.now) } 
  scope :upcoming_event, ->{ where('date >= ?', Time.zone.now) } 

  validates :date, presence: true
  validates :details, presence: true
end
