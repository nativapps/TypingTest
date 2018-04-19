class HasParticipant < ApplicationRecord
  belongs_to :room
  belongs_to :participant
end
