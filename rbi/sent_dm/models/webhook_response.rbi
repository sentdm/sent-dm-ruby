# typed: strong

module SentDm
  module Models
    class WebhookResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::WebhookResponse, SentDm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(Integer)) }
      attr_reader :consecutive_failures

      sig { params(consecutive_failures: Integer).void }
      attr_writer :consecutive_failures

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

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

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      sig { returns(T.nilable(Time)) }
      attr_accessor :last_delivery_attempt_at

      sig { returns(T.nilable(Time)) }
      attr_accessor :last_successful_delivery_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :retry_count

      sig { params(retry_count: Integer).void }
      attr_writer :retry_count

      sig { returns(T.nilable(String)) }
      attr_accessor :signing_secret

      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_seconds

      sig { params(timeout_seconds: Integer).void }
      attr_writer :timeout_seconds

      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      sig do
        params(
          id: String,
          consecutive_failures: Integer,
          created_at: Time,
          display_name: String,
          endpoint_url: String,
          event_types: T::Array[String],
          is_active: T::Boolean,
          last_delivery_attempt_at: T.nilable(Time),
          last_successful_delivery_at: T.nilable(Time),
          retry_count: Integer,
          signing_secret: T.nilable(String),
          timeout_seconds: Integer,
          updated_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        consecutive_failures: nil,
        created_at: nil,
        display_name: nil,
        endpoint_url: nil,
        event_types: nil,
        is_active: nil,
        last_delivery_attempt_at: nil,
        last_successful_delivery_at: nil,
        retry_count: nil,
        signing_secret: nil,
        timeout_seconds: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            consecutive_failures: Integer,
            created_at: Time,
            display_name: String,
            endpoint_url: String,
            event_types: T::Array[String],
            is_active: T::Boolean,
            last_delivery_attempt_at: T.nilable(Time),
            last_successful_delivery_at: T.nilable(Time),
            retry_count: Integer,
            signing_secret: T.nilable(String),
            timeout_seconds: Integer,
            updated_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end
    end
  end
end
