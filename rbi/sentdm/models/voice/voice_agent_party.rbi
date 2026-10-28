# typed: strong

module Sentdm
  module Models
    VoiceAgentParty = Voice::VoiceAgentParty

    module Voice
      class VoiceAgentParty < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentParty, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :kind

        sig { params(kind: String).void }
        attr_writer :kind

        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        sig { params(kind: String, value: String).returns(T.attached_class) }
        def self.new(kind: nil, value: nil)
        end

        sig { override.returns({ kind: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
