# typed: strong

module Sentdm
  module Models
    class WebhookUpdateResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::WebhookUpdateResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig { returns(T.nilable(Sentdm::Models::WebhookUpdateResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::WebhookUpdateResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::WebhookUpdateResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::WebhookUpdateResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::WebhookUpdateResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::WebhookUpdateResponse::Meta::OrHash).void
      end
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::Models::WebhookUpdateResponse::Data::OrHash),
          error:
            T.nilable(Sentdm::Models::WebhookUpdateResponse::Error::OrHash),
          meta: Sentdm::Models::WebhookUpdateResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
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
            data: T.nilable(Sentdm::Models::WebhookUpdateResponse::Data),
            error: T.nilable(Sentdm::Models::WebhookUpdateResponse::Error),
            meta: Sentdm::Models::WebhookUpdateResponse::Meta,
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
              Sentdm::Models::WebhookUpdateResponse::Data,
              Sentdm::Internal::AnyHash
            )
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

        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :event_filters

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

        # The response data (null if error)
        sig do
          params(
            id: String,
            consecutive_failures: Integer,
            created_at: Time,
            display_name: String,
            endpoint_url: String,
            event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
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
          event_filters: nil,
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
              event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
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

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::WebhookUpdateResponse::Error,
              Sentdm::Internal::AnyHash
            )
          end

        # Machine-readable error code (e.g., "RESOURCE_001")
        sig { returns(T.nilable(String)) }
        attr_reader :code

        sig { params(code: String).void }
        attr_writer :code

        # Additional validation error details (field-level errors)
        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :details

        # URL to documentation about this error
        sig { returns(T.nilable(String)) }
        attr_accessor :doc_url

        # Human-readable error message
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Error information
        sig do
          params(
            code: String,
            details: T.nilable(T::Hash[Symbol, T::Array[String]]),
            doc_url: T.nilable(String),
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code (e.g., "RESOURCE_001")
          code: nil,
          # Additional validation error details (field-level errors)
          details: nil,
          # URL to documentation about this error
          doc_url: nil,
          # Human-readable error message
          message: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              details: T.nilable(T::Hash[Symbol, T::Array[String]]),
              doc_url: T.nilable(String),
              message: String
            }
          )
        end
        def to_hash
        end
      end

      class Meta < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::WebhookUpdateResponse::Meta,
              Sentdm::Internal::AnyHash
            )
          end

        # Unique identifier for this request (for tracing and support)
        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        # Server timestamp when the response was generated
        sig { returns(T.nilable(Time)) }
        attr_reader :timestamp

        sig { params(timestamp: Time).void }
        attr_writer :timestamp

        # API version used for this request
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Request and response metadata
        sig do
          params(request_id: String, timestamp: Time, version: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier for this request (for tracing and support)
          request_id: nil,
          # Server timestamp when the response was generated
          timestamp: nil,
          # API version used for this request
          version: nil
        )
        end

        sig do
          override.returns(
            { request_id: String, timestamp: Time, version: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
