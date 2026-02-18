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

      # Default messaging channel: "sms" or "whatsapp"
      sig { returns(T.nilable(String)) }
      attr_accessor :default_channel

      # Whether the contact has opted out of messaging
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :opt_out

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          default_channel: T.nilable(String),
          opt_out: T.nilable(T::Boolean),
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Default messaging channel: "sms" or "whatsapp"
        default_channel: nil,
        # Whether the contact has opted out of messaging
        opt_out: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            default_channel: T.nilable(String),
            opt_out: T.nilable(T::Boolean),
            test_mode: T::Boolean,
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
