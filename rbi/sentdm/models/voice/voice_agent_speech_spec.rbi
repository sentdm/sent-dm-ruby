# typed: strong

module Sentdm
  module Models
    VoiceAgentSpeechSpec = Voice::VoiceAgentSpeechSpec

    module Voice
      class VoiceAgentSpeechSpec < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Voice::VoiceAgentSpeechSpec,
              Sentdm::Internal::AnyHash
            )
          end

        # The language spoken and listened for, a BCP 47 tag from GET /v3/voice/voices.
        # Default en-US.
        sig { returns(T.nilable(String)) }
        attr_accessor :language

        # standard, Sent's speech. Other settings are not available yet.
        sig { returns(T.nilable(String)) }
        attr_accessor :setting

        # A voice name from GET /v3/voice/voices. Default: the catalogue's default voice.
        sig { returns(T.nilable(String)) }
        attr_accessor :voice

        sig do
          params(
            language: T.nilable(String),
            setting: T.nilable(String),
            voice: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The language spoken and listened for, a BCP 47 tag from GET /v3/voice/voices.
          # Default en-US.
          language: nil,
          # standard, Sent's speech. Other settings are not available yet.
          setting: nil,
          # A voice name from GET /v3/voice/voices. Default: the catalogue's default voice.
          voice: nil
        )
        end

        sig do
          override.returns(
            {
              language: T.nilable(String),
              setting: T.nilable(String),
              voice: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
