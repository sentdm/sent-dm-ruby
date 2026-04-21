# typed: strong

module Sentdm
  module Models
    class ContactUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactUpdateParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Consent status by channel. Keys: "sms", "whatsapp". Values: "opted_in",
      # "opted_out". All entries must have the same status — mixed values (e.g., sms:
      # opted_out + whatsapp: opted_in) are rejected with 400. The provided status is
      # applied to ALL channels regardless of which keys are specified, because consent
      # is global across channels. When provided, takes precedence over the opt_out
      # field.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :channel_consent

      # Default messaging channel: "sms" or "whatsapp"
      sig { returns(T.nilable(String)) }
      attr_accessor :default_channel

      # Whether the contact has opted out of messaging
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :opt_out

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

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
          id: String,
          channel_consent: T.nilable(T::Hash[Symbol, String]),
          default_channel: T.nilable(String),
          opt_out: T.nilable(T::Boolean),
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Consent status by channel. Keys: "sms", "whatsapp". Values: "opted_in",
        # "opted_out". All entries must have the same status — mixed values (e.g., sms:
        # opted_out + whatsapp: opted_in) are rejected with 400. The provided status is
        # applied to ALL channels regardless of which keys are specified, because consent
        # is global across channels. When provided, takes precedence over the opt_out
        # field.
        channel_consent: nil,
        # Default messaging channel: "sms" or "whatsapp"
        default_channel: nil,
        # Whether the contact has opted out of messaging
        opt_out: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channel_consent: T.nilable(T::Hash[Symbol, String]),
            default_channel: T.nilable(String),
            opt_out: T.nilable(T::Boolean),
            sandbox: T::Boolean,
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
