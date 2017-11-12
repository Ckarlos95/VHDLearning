class UserProgress < ActiveRecord::Base
  # Intermediate table between users and topics
  belongs_to :user
  belongs_to :topic
end
