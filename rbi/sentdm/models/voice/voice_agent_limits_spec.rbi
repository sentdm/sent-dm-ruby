# typed: strong

module Sentdm
  module Models
    VoiceAgentLimitsSpec = Voice::VoiceAgentLimitsSpec

    module Voice
      class VoiceAgentLimitsSpec < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Voice::VoiceAgentLimitsSpec,
              Sentdm::Internal::AnyHash
            )
          end

        # ISO 3166-1 alpha-2 codes of the countries the agent may call or transfer to.
        # Omit it to allow every country. Stored now, applied when the agent places calls.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_countries

        # The longest a call may last, 60 to 14,400 seconds. Default 3,600.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_call_seconds

        # How many calls the agent may have going at once, from 1. Default 10.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_concurrent_calls

        sig do
          params(
            allowed_countries: T.nilable(T::Array[String]),
            max_call_seconds: T.nilable(Integer),
            max_concurrent_calls: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # ISO 3166-1 alpha-2 codes of the countries the agent may call or transfer to.
          # Omit it to allow every country. Stored now, applied when the agent places calls.
          allowed_countries: nil,
          # The longest a call may last, 60 to 14,400 seconds. Default 3,600.
          max_call_seconds: nil,
          # How many calls the agent may have going at once, from 1. Default 10.
          max_concurrent_calls: nil
        )
        end

        sig do
          override.returns(
            {
              allowed_countries: T.nilable(T::Array[String]),
              max_call_seconds: T.nilable(Integer),
              max_concurrent_calls: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
