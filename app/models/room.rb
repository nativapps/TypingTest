class Room < ApplicationRecord

    has_many :has_participants
    has_many :participants, through: :has_participants
    
    after_create :save_participants

    def participants=(value)
        @participants = value
    end

    private

    def save_participants
        if @participants.blank? 
                
        else
            @participants.each do |participant_id|
                HasParticipant.create(participant_id: participant_id, room_id: self.id)
            end
        end
    end
end
