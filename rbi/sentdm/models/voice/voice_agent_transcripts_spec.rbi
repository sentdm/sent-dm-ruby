# typed: strong

module Sentdm
  module Models
    VoiceAgentTranscriptsSpec = Voice::VoiceAgentTranscriptsSpec

    module Voice
      class VoiceAgentTranscriptsSpec < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Voice::VoiceAgentTranscriptsSpec,
              Sentdm::Internal::AnyHash
            )
          end

        # How long a stored transcript is kept, 1 to 365 days. Default 30.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :retention_days

        # Whether Sent keeps the call's transcript. Default false. Stored now, applied
        # when transcripts land.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :store

        sig do
          params(
            retention_days: T.nilable(Integer),
            store: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # How long a stored transcript is kept, 1 to 365 days. Default 30.
          retention_days: nil,
          # Whether Sent keeps the call's transcript. Default false. Stored now, applied
          # when transcripts land.
          store: nil
        )
        end

        sig do
          override.returns(
            { retention_days: T.nilable(Integer), store: T.nilable(T::Boolean) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
