# typed: strong

module Sentdm
  module Models
    class WebhookCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookCreateParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      sig { returns(T.nilable(String)) }
      attr_reader :endpoint_url

      sig { params(endpoint_url: String).void }
      attr_writer :endpoint_url

      sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
      attr_accessor :event_filters

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :event_types

      sig { params(event_types: T::Array[String]).void }
      attr_writer :event_types

      sig { returns(T.nilable(Integer)) }
      attr_reader :retry_count

      sig { params(retry_count: Integer).void }
      attr_writer :retry_count

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Request-only: the events an organization webhook's sender profile clones
      # receive, one clone per existing and future profile. Responses never return it.
      sig { returns(T.nilable(Sentdm::WebhookCreateParams::SenderProfile)) }
      attr_reader :sender_profile

      sig do
        params(
          sender_profile:
            T.nilable(Sentdm::WebhookCreateParams::SenderProfile::OrHash)
        ).void
      end
      attr_writer :sender_profile

      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_seconds

      sig { params(timeout_seconds: Integer).void }
      attr_writer :timeout_seconds

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
          display_name: String,
          endpoint_url: String,
          event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
          event_types: T::Array[String],
          retry_count: Integer,
          sandbox: T::Boolean,
          sender_profile:
            T.nilable(Sentdm::WebhookCreateParams::SenderProfile::OrHash),
          timeout_seconds: Integer,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        display_name: nil,
        endpoint_url: nil,
        event_filters: nil,
        event_types: nil,
        retry_count: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Request-only: the events an organization webhook's sender profile clones
        # receive, one clone per existing and future profile. Responses never return it.
        sender_profile: nil,
        timeout_seconds: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            display_name: String,
            endpoint_url: String,
            event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
            event_types: T::Array[String],
            retry_count: Integer,
            sandbox: T::Boolean,
            sender_profile:
              T.nilable(Sentdm::WebhookCreateParams::SenderProfile),
            timeout_seconds: Integer,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class SenderProfile < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::WebhookCreateParams::SenderProfile,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :event_filters

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :event_types

        sig { params(event_types: T::Array[String]).void }
        attr_writer :event_types

        # Request-only: the events an organization webhook's sender profile clones
        # receive, one clone per existing and future profile. Responses never return it.
        sig do
          params(
            event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
            event_types: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(event_filters: nil, event_types: nil)
        end

        sig do
          override.returns(
            {
              event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
              event_types: T::Array[String]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
