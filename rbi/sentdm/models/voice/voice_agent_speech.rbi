# typed: strong

module Sentdm
  module Models
    VoiceAgentSpeech = Voice::VoiceAgentSpeech

    module Voice
      class VoiceAgentSpeech < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentSpeech, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        sig { returns(T.nilable(String)) }
        attr_reader :setting

        sig { params(setting: String).void }
        attr_writer :setting

        sig { returns(T.nilable(String)) }
        attr_reader :voice

        sig { params(voice: String).void }
        attr_writer :voice

        sig do
          params(language: String, setting: String, voice: String).returns(
            T.attached_class
          )
        end
        def self.new(language: nil, setting: nil, voice: nil)
        end

        sig do
          override.returns({ language: String, setting: String, voice: String })
        end
        def to_hash
        end
      end
    end
  end
end
