# typed: strong

module SentDm
  module Models
    class WebhookUpdateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::WebhookUpdateParams, SentDm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      sig { returns(T.nilable(String)) }
      attr_reader :endpoint_url

      sig { params(endpoint_url: String).void }
      attr_writer :endpoint_url

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :event_types

      sig { params(event_types: T::Array[String]).void }
      attr_writer :event_types

      sig { returns(T.nilable(Integer)) }
      attr_reader :retry_count

      sig { params(retry_count: Integer).void }
      attr_writer :retry_count

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_seconds

      sig { params(timeout_seconds: Integer).void }
      attr_writer :timeout_seconds

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          display_name: String,
          endpoint_url: String,
          event_types: T::Array[String],
          retry_count: Integer,
          test_mode: T::Boolean,
          timeout_seconds: Integer,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        display_name: nil,
        endpoint_url: nil,
        event_types: nil,
        retry_count: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        timeout_seconds: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            display_name: String,
            endpoint_url: String,
            event_types: T::Array[String],
            retry_count: Integer,
            test_mode: T::Boolean,
            timeout_seconds: Integer,
            idempotency_key: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
