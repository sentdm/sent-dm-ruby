# typed: strong

module Sentdm
  module Models
    VoiceAgentSecret = Voice::VoiceAgentSecret

    module Voice
      class VoiceAgentSecret < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgentSecret, Sentdm::Internal::AnyHash)
          end

        # The new whsec\_ secret. The previous one stopped signing the moment this was
        # returned. Shown once.
        sig { returns(T.nilable(String)) }
        attr_reader :signing_secret

        sig { params(signing_secret: String).void }
        attr_writer :signing_secret

        # A freshly rotated signing secret.
        sig { params(signing_secret: String).returns(T.attached_class) }
        def self.new(
          # The new whsec\_ secret. The previous one stopped signing the moment this was
          # returned. Shown once.
          signing_secret: nil
        )
        end

        sig { override.returns({ signing_secret: String }) }
        def to_hash
        end
      end
    end
  end
end
