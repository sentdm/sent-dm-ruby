# typed: strong

module Sentdm
  module Models
    VoiceAgentAudio = Voice::VoiceAgentAudio

    module Voice
      class VoiceAgentAudio < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentAudio, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :sample_rate

        sig { params(sample_rate: Integer).void }
        attr_writer :sample_rate

        sig { params(sample_rate: Integer).returns(T.attached_class) }
        def self.new(sample_rate: nil)
        end

        sig { override.returns({ sample_rate: Integer }) }
        def to_hash
        end
      end
    end
  end
end
