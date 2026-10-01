# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceSecret < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::VoiceSecret, Sentdm::Internal::AnyHash)
          end

        # The new whsec\_ secret. The previous one stopped signing the moment this was
        # returned, so update your backend before the next call reaches it. Shown once.
        sig { returns(T.nilable(String)) }
        attr_reader :callback_secret

        sig { params(callback_secret: String).void }
        attr_writer :callback_secret

        # A freshly rotated callback signing secret
        sig { params(callback_secret: String).returns(T.attached_class) }
        def self.new(
          # The new whsec\_ secret. The previous one stopped signing the moment this was
          # returned, so update your backend before the next call reaches it. Shown once.
          callback_secret: nil
        )
        end

        sig { override.returns({ callback_secret: String }) }
        def to_hash
        end
      end
    end
  end
end
