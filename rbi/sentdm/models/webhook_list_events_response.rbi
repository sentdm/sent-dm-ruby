# typed: strong

module Sentdm
  module Models
    class WebhookListEventsResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::WebhookListEventsResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventsResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(Sentdm::Models::WebhookListEventsResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventsResponse::Error))
      end
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(Sentdm::Models::WebhookListEventsResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventsResponse::Meta))
      end
      attr_reader :meta

      sig do
        params(
          meta: Sentdm::Models::WebhookListEventsResponse::Meta::OrHash
        ).void
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
          data:
            T.nilable(Sentdm::Models::WebhookListEventsResponse::Data::OrHash),
          error:
            T.nilable(Sentdm::Models::WebhookListEventsResponse::Error::OrHash),
          meta: Sentdm::Models::WebhookListEventsResponse::Meta::OrHash,
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
            data: T.nilable(Sentdm::Models::WebhookListEventsResponse::Data),
            error: T.nilable(Sentdm::Models::WebhookListEventsResponse::Error),
            meta: Sentdm::Models::WebhookListEventsResponse::Meta,
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
              Sentdm::Models::WebhookListEventsResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::WebhookListEventsResponse::Data::Event]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[
                Sentdm::Models::WebhookListEventsResponse::Data::Event::OrHash
              ]
          ).void
        end
        attr_writer :events

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(
              Sentdm::Models::WebhookListEventsResponse::Data::Pagination
            )
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::WebhookListEventsResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        # The response data (null if error)
        sig do
          params(
            events:
              T::Array[
                Sentdm::Models::WebhookListEventsResponse::Data::Event::OrHash
              ],
            pagination:
              Sentdm::Models::WebhookListEventsResponse::Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          events: nil,
          # Pagination metadata for list responses
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              events:
                T::Array[
                  Sentdm::Models::WebhookListEventsResponse::Data::Event
                ],
              pagination:
                Sentdm::Models::WebhookListEventsResponse::Data::Pagination
            }
          )
        end
        def to_hash
        end

        class Event < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListEventsResponse::Data::Event,
                Sentdm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          sig { returns(T.nilable(Integer)) }
          attr_reader :delivery_attempts

          sig { params(delivery_attempts: Integer).void }
          attr_writer :delivery_attempts

          sig { returns(T.nilable(String)) }
          attr_reader :delivery_status

          sig { params(delivery_status: String).void }
          attr_writer :delivery_status

          sig { returns(T.nilable(String)) }
          attr_accessor :error_message

          sig { returns(T.nilable(T.anything)) }
          attr_reader :event_data

          sig { params(event_data: T.anything).void }
          attr_writer :event_data

          sig { returns(T.nilable(String)) }
          attr_reader :event_type

          sig { params(event_type: String).void }
          attr_writer :event_type

          sig { returns(T.nilable(Integer)) }
          attr_accessor :http_status_code

          sig { returns(T.nilable(Time)) }
          attr_accessor :processing_completed_at

          sig { returns(T.nilable(Time)) }
          attr_accessor :processing_started_at

          sig { returns(T.nilable(String)) }
          attr_accessor :response_body

          sig do
            params(
              id: String,
              created_at: Time,
              delivery_attempts: Integer,
              delivery_status: String,
              error_message: T.nilable(String),
              event_data: T.anything,
              event_type: String,
              http_status_code: T.nilable(Integer),
              processing_completed_at: T.nilable(Time),
              processing_started_at: T.nilable(Time),
              response_body: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id: nil,
            created_at: nil,
            delivery_attempts: nil,
            delivery_status: nil,
            error_message: nil,
            event_data: nil,
            event_type: nil,
            http_status_code: nil,
            processing_completed_at: nil,
            processing_started_at: nil,
            response_body: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                delivery_attempts: Integer,
                delivery_status: String,
                error_message: T.nilable(String),
                event_data: T.anything,
                event_type: String,
                http_status_code: T.nilable(Integer),
                processing_completed_at: T.nilable(Time),
                processing_started_at: T.nilable(Time),
                response_body: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListEventsResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination pointers
          sig do
            returns(
              T.nilable(
                Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors::OrHash
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
                  Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors::OrHash
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
                    Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors
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
                  Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors,
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
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::WebhookListEventsResponse::Error,
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
              Sentdm::Models::WebhookListEventsResponse::Meta,
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
