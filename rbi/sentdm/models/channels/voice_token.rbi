# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceToken < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::VoiceToken, Sentdm::Internal::AnyHash)
          end

        # The signed token. Hand it to the client SDK unchanged.
        sig { returns(T.nilable(String)) }
        attr_reader :token

        sig { params(token: String).void }
        attr_writer :token

        # When the token expires (UTC)
        sig { returns(T.nilable(Time)) }
        attr_reader :expires_at

        sig { params(expires_at: Time).void }
        attr_writer :expires_at

        # The identity the token was minted for
        sig { returns(T.nilable(String)) }
        attr_reader :identity

        sig { params(identity: String).void }
        attr_writer :identity

        # The phone number this identity is now bound to, in E.164 format
        sig { returns(T.nilable(String)) }
        attr_reader :number

        sig { params(number: String).void }
        attr_writer :number

        # A short-lived token your app passes to the voice client SDK to register
        sig do
          params(
            token: String,
            expires_at: Time,
            identity: String,
            number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The signed token. Hand it to the client SDK unchanged.
          token: nil,
          # When the token expires (UTC)
          expires_at: nil,
          # The identity the token was minted for
          identity: nil,
          # The phone number this identity is now bound to, in E.164 format
          number: nil
        )
        end

        sig do
          override.returns(
            {
              token: String,
              expires_at: Time,
              identity: String,
              number: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
