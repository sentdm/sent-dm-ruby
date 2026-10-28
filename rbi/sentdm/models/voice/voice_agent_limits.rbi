# typed: strong

module Sentdm
  module Models
    VoiceAgentLimits = Voice::VoiceAgentLimits

    module Voice
      class VoiceAgentLimits < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentLimits, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_countries

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_call_seconds

        sig { params(max_call_seconds: Integer).void }
        attr_writer :max_call_seconds

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_concurrent_calls

        sig { params(max_concurrent_calls: Integer).void }
        attr_writer :max_concurrent_calls

        sig do
          params(
            allowed_countries: T.nilable(T::Array[String]),
            max_call_seconds: Integer,
            max_concurrent_calls: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_countries: nil,
          max_call_seconds: nil,
          max_concurrent_calls: nil
        )
        end

        sig do
          override.returns(
            {
              allowed_countries: T.nilable(T::Array[String]),
              max_call_seconds: Integer,
              max_concurrent_calls: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
