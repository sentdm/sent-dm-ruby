# typed: strong

module Sentdm
  module Models
    module Channels
      class APIResponseOfVoiceToken < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::APIResponseOfVoiceToken,
              Sentdm::Internal::AnyHash
            )
          end

        # A short-lived token your app passes to the voice client SDK to register
        sig do
          returns(T.nilable(Sentdm::Channels::APIResponseOfVoiceToken::Data))
        end
        attr_reader :data

        sig do
          params(
            data:
              T.nilable(Sentdm::Channels::APIResponseOfVoiceToken::Data::OrHash)
          ).void
        end
        attr_writer :data

        # Error information
        sig { returns(T.nilable(Sentdm::ErrorDetail)) }
        attr_reader :error

        sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
        attr_writer :error

        # Request and response metadata
        sig { returns(T.nilable(Sentdm::APIMeta)) }
        attr_reader :meta

        sig { params(meta: Sentdm::APIMeta::OrHash).void }
        attr_writer :meta

        # Indicates whether the request was successful
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :success

        sig { params(success: T::Boolean).void }
        attr_writer :success

        # Standard API response envelope for all v3 endpoints
        sig do
          params(
            data:
              T.nilable(
                Sentdm::Channels::APIResponseOfVoiceToken::Data::OrHash
              ),
            error: T.nilable(Sentdm::ErrorDetail::OrHash),
            meta: Sentdm::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # A short-lived token your app passes to the voice client SDK to register
          data: nil,
          # Error information
          error: nil,
          # Request and response metadata
          meta: nil,
          # Indicates whether the request was successful
          success: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(Sentdm::Channels::APIResponseOfVoiceToken::Data),
              error: T.nilable(Sentdm::ErrorDetail),
              meta: Sentdm::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end

        class Data < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::APIResponseOfVoiceToken::Data,
                Sentdm::Internal::AnyHash
              )
            end

          # The signed token. Hand it to the client SDK unchanged. Treat it as opaque: read
          # the identity, number, and expiry from this response, not from the token.
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
            # The signed token. Hand it to the client SDK unchanged. Treat it as opaque: read
            # the identity, number, and expiry from this response, not from the token.
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
end
