# typed: strong

module Sentdm
  module Models
    CallParticipant = Calls::CallParticipant

    module Calls
      class CallParticipant < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Calls::CallParticipant, Sentdm::Internal::AnyHash)
          end

        # The participant's own call id: what the mute and remove endpoints take, and what
        # GET /v3/calls/{id} accepts
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # How long the participant has been connected to the room, in seconds
        sig { returns(T.nilable(Integer)) }
        attr_reader :duration_seconds

        sig { params(duration_seconds: Integer).void }
        attr_writer :duration_seconds

        # user for one of your app users, number for a phone number, anonymous for a
        # caller who withheld their number
        sig { returns(T.nilable(String)) }
        attr_reader :kind

        sig { params(kind: String).void }
        attr_writer :kind

        # True while the room mutes this participant
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :muted

        sig { params(muted: T::Boolean).void }
        attr_writer :muted

        # The app user's identity or the phone number in E.164 format. Null when the kind
        # is anonymous
        sig { returns(T.nilable(String)) }
        attr_accessor :value

        # A participant of a conference call
        sig do
          params(
            id: String,
            duration_seconds: Integer,
            kind: String,
            muted: T::Boolean,
            value: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The participant's own call id: what the mute and remove endpoints take, and what
          # GET /v3/calls/{id} accepts
          id: nil,
          # How long the participant has been connected to the room, in seconds
          duration_seconds: nil,
          # user for one of your app users, number for a phone number, anonymous for a
          # caller who withheld their number
          kind: nil,
          # True while the room mutes this participant
          muted: nil,
          # The app user's identity or the phone number in E.164 format. Null when the kind
          # is anonymous
          value: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              duration_seconds: Integer,
              kind: String,
              muted: T::Boolean,
              value: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
