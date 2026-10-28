# typed: strong

module Sentdm
  module Models
    VoiceAgentTranscripts = Voice::VoiceAgentTranscripts

    module Voice
      class VoiceAgentTranscripts < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Voice::VoiceAgentTranscripts,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :retention_days

        sig { params(retention_days: Integer).void }
        attr_writer :retention_days

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :store

        sig { params(store: T::Boolean).void }
        attr_writer :store

        sig do
          params(retention_days: Integer, store: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(retention_days: nil, store: nil)
        end

        sig { override.returns({ retention_days: Integer, store: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
