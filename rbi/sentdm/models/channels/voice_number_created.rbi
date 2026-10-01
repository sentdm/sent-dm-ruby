# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceNumberCreated < Sentdm::Models::Channels::VoiceNumber
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceNumberCreated,
              Sentdm::Internal::AnyHash
            )
          end

        # The whsec\_ secret every question to callback_url is signed with. Shown here and
        # by POST /v3/channels/voice/{number}/rotate-secret, nowhere else: store it now.
        # Verify a question exactly as you verify a webhook, with X-Webhook-ID,
        # X-Webhook-Timestamp and the body.
        sig { returns(T.nilable(String)) }
        attr_reader :callback_secret

        sig { params(callback_secret: String).void }
        attr_writer :callback_secret

        # One number the profile carries phone calls on.
        sig { params(callback_secret: String).returns(T.attached_class) }
        def self.new(
          # The whsec\_ secret every question to callback_url is signed with. Shown here and
          # by POST /v3/channels/voice/{number}/rotate-secret, nowhere else: store it now.
          # Verify a question exactly as you verify a webhook, with X-Webhook-ID,
          # X-Webhook-Timestamp and the body.
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
