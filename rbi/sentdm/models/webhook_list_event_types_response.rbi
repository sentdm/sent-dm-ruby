# typed: strong

module Sentdm
  module Models
    class WebhookListEventTypesResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::WebhookListEventTypesResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # The webhook event types a customer can subscribe to.
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Data::OrHash
            )
        ).void
      end
      attr_writer :data

      # Error information
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Error))
      end
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Error::OrHash
            )
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig do
        returns(T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Meta))
      end
      attr_reader :meta

      sig do
        params(
          meta: Sentdm::Models::WebhookListEventTypesResponse::Meta::OrHash
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
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Data::OrHash
            ),
          error:
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Error::OrHash
            ),
          meta: Sentdm::Models::WebhookListEventTypesResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The webhook event types a customer can subscribe to.
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
            data:
              T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Data),
            error:
              T.nilable(Sentdm::Models::WebhookListEventTypesResponse::Error),
            meta: Sentdm::Models::WebhookListEventTypesResponse::Meta,
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
              Sentdm::Models::WebhookListEventTypesResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # The event_types on this page.
        sig do
          returns(
            T.nilable(
              T::Array[
                Sentdm::Models::WebhookListEventTypesResponse::Data::EventType
              ]
            )
          )
        end
        attr_reader :event_types

        sig do
          params(
            event_types:
              T::Array[
                Sentdm::Models::WebhookListEventTypesResponse::Data::EventType::OrHash
              ]
          ).void
        end
        attr_writer :event_types

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(
              Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination
            )
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        # The webhook event types a customer can subscribe to.
        sig do
          params(
            event_types:
              T::Array[
                Sentdm::Models::WebhookListEventTypesResponse::Data::EventType::OrHash
              ],
            pagination:
              Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The event_types on this page.
          event_types: nil,
          # Pagination metadata for list responses
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              event_types:
                T::Array[
                  Sentdm::Models::WebhookListEventTypesResponse::Data::EventType
                ],
              pagination:
                Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination
            }
          )
        end
        def to_hash
        end

        class EventType < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::WebhookListEventTypesResponse::Data::EventType,
                Sentdm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_reader :display_name

          sig { params(display_name: String).void }
          attr_writer :display_name

          sig { returns(T.nilable(String)) }
          attr_accessor :event_type

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_active

          sig { params(is_active: T::Boolean).void }
          attr_writer :is_active

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(T::Array[T.anything])) }
          attr_accessor :sub_types

          sig do
            params(
              description: T.nilable(String),
              display_name: String,
              event_type: T.nilable(String),
              is_active: T::Boolean,
              name: String,
              sub_types: T.nilable(T::Array[T.anything])
            ).returns(T.attached_class)
          end
          def self.new(
            description: nil,
            display_name: nil,
            event_type: nil,
            is_active: nil,
            name: nil,
            sub_types: nil
          )
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                display_name: String,
                event_type: T.nilable(String),
                is_active: T::Boolean,
                name: String,
                sub_types: T.nilable(T::Array[T.anything])
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
                Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination. Never populated — see Cursors.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors::OrHash
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
                  Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors::OrHash
                ),
              has_more: T::Boolean,
              page: Integer,
              page_size: Integer,
              total_count: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Cursor-based pagination. Never populated — see Cursors.
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
                    Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors
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
                  Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors,
                  Sentdm::Internal::AnyHash
                )
              end

            # Cursor to fetch the next page.
            sig { returns(T.nilable(String)) }
            attr_accessor :after

            # Cursor to fetch the previous page.
            sig { returns(T.nilable(String)) }
            attr_accessor :before

            # Cursor-based pagination. Never populated — see Cursors.
            sig do
              params(
                after: T.nilable(String),
                before: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Cursor to fetch the next page.
              after: nil,
              # Cursor to fetch the previous page.
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
              Sentdm::Models::WebhookListEventTypesResponse::Error,
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
              Sentdm::Models::WebhookListEventTypesResponse::Meta,
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
