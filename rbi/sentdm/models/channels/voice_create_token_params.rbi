# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceCreateTokenParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceCreateTokenParams,
              Sentdm::Internal::AnyHash
            )
          end

        # Your identifier for the app user, such as an agent or account id. Letters,
        # digits, hyphens and underscores only, up to 200 characters.
        sig { returns(T.nilable(String)) }
        attr_reader :identity

        sig { params(identity: String).void }
        attr_writer :identity

        # One of your voice-enabled phone numbers in E.164 format. Calls placed by this
        # identity are routed through that number. Omit to use your default app-call
        # number.
        sig { returns(T.nilable(String)) }
        attr_accessor :number

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # Token lifetime in seconds. Defaults to 600 and cannot exceed 3600.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :ttl

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            identity: String,
            number: T.nilable(String),
            sandbox: T::Boolean,
            ttl: T.nilable(Integer),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Your identifier for the app user, such as an agent or account id. Letters,
          # digits, hyphens and underscores only, up to 200 characters.
          identity: nil,
          # One of your voice-enabled phone numbers in E.164 format. Calls placed by this
          # identity are routed through that number. Omit to use your default app-call
          # number.
          number: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # Token lifetime in seconds. Defaults to 600 and cannot exceed 3600.
          ttl: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              identity: String,
              number: T.nilable(String),
              sandbox: T::Boolean,
              ttl: T.nilable(Integer),
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
