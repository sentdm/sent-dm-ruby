# typed: strong

module Sentdm
  module Models
    class WebhookListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::WebhookListResponse, Sentdm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(Sentdm::Models::WebhookListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::WebhookListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::WebhookListResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::WebhookListResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::WebhookListResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::WebhookListResponse::Meta::OrHash).void
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
          data: T.nilable(Sentdm::Models::WebhookListResponse::Data::OrHash),
          error: T.nilable(Sentdm::Models::WebhookListResponse::Error::OrHash),
          meta: Sentdm::Models::WebhookListResponse::Meta::OrHash,
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
            data: T.nilable(Sentdm::Models::WebhookListResponse::Data),
            error: T.nilable(Sentdm::Models::WebhookListResponse::Error),
            meta: Sentdm::Models::WebhookListResponse::Meta,
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
              Sentdm::Models::WebhookListResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(Sentdm::Models::WebhookListResponse::Data::Pagination)
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::WebhookListResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::WebhookListResponse::Data::Webhook]
            )
          )
        end
        attr_reader :webhooks

        sig do
          params(
            webhooks:
              T::Array[
                Sentdm::Models::WebhookListResponse::Data::Webhook::OrHash
              ]
          ).void
        end
        attr_writer :webhooks

        # The response data (null if error)
        sig do
          params(
            pagination:
              Sentdm::Models::WebhookListResponse::Data::Pagination::OrHash,
            webhooks:
              T::Array[
                Sentdm::Models::WebhookListResponse::Data::Webhook::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination metadata for list responses
          pagination: nil,
          webhooks: nil
        )
        end

        sig do
          override.returns(
            {
              pagination: Sentdm::Models::WebhookListResponse::Data::Pagination,
              webhooks:
                T::Array[Sentdm::Models::WebhookListResponse::Data::Webhook]
            }
          )
        end
        def to_hash
        end

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination pointers
          sig do
            returns(
              T.nilable(
                Sentdm::Models::WebhookListResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::WebhookListResponse::Data::Pagination::Cursors::OrHash
                )
            ).void
          end
          attr_writer :cursors

          # Whether there are more pages after this one
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_more

          sig { params(has_more: T::Boolean).void }
          attr_writer :has_more

          # Current page number (1-indexed)
          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          # Number of items per page
          sig { returns(T.nilable(Integer)) }
          attr_reader :page_size

          sig { params(page_size: Integer).void }
          attr_writer :page_size

          # Total number of items across all pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_count

          sig { params(total_count: Integer).void }
          attr_writer :total_count

          # Total number of pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          # Pagination metadata for list responses
          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::WebhookListResponse::Data::Pagination::Cursors::OrHash
                ),
              has_more: T::Boolean,
              page: Integer,
              page_size: Integer,
              total_count: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Cursor-based pagination pointers
            cursors: nil,
            # Whether there are more pages after this one
            has_more: nil,
            # Current page number (1-indexed)
            page: nil,
            # Number of items per page
            page_size: nil,
            # Total number of items across all pages
            total_count: nil,
            # Total number of pages
            total_pages: nil
          )
          end

          sig do
            override.returns(
              {
                cursors:
                  T.nilable(
                    Sentdm::Models::WebhookListResponse::Data::Pagination::Cursors
                  ),
                has_more: T::Boolean,
                page: Integer,
                page_size: Integer,
                total_count: Integer,
                total_pages: Integer
              }
            )
          end
          def to_hash
          end

          class Cursors < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::WebhookListResponse::Data::Pagination::Cursors,
                  Sentdm::Internal::AnyHash
                )
              end

            # Cursor to fetch the next page
            sig { returns(T.nilable(String)) }
            attr_accessor :after

            # Cursor to fetch the previous page
            sig { returns(T.nilable(String)) }
            attr_accessor :before

            # Cursor-based pagination pointers
            sig do
              params(
                after: T.nilable(String),
                before: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Cursor to fetch the next page
              after: nil,
              # Cursor to fetch the previous page
              before: nil
            )
            end

            sig do
              override.returns(
                { after: T.nilable(String), before: T.nilable(String) }
              )
            end
            def to_hash
            end
          end
        end

        class Webhook < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListResponse::Data::Webhook,
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
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::WebhookListResponse::Error,
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
              Sentdm::Models::WebhookListResponse::Meta,
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
