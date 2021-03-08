class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', dependent: :destroy, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances

  validates :name, presence: true
end
