# typed: strong

module Sentdm
  module Models
    VoiceAgentAudioSpec = Voice::VoiceAgentAudioSpec

    module Voice
      class VoiceAgentAudioSpec < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentAudioSpec, Sentdm::Internal::AnyHash)
          end

        # Samples per second of the audio exchanged: 8000, 16000 or 24000. Default 16000.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :sample_rate

        sig do
          params(sample_rate: T.nilable(Integer)).returns(T.attached_class)
        end
        def self.new(
          # Samples per second of the audio exchanged: 8000, 16000 or 24000. Default 16000.
          sample_rate: nil
        )
        end

        sig { override.returns({ sample_rate: T.nilable(Integer) }) }
        def to_hash
        end
      end
    end
  end
end
