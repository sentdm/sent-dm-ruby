# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_event_types
    class WebhookListEventTypesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The webhook event types a customer can subscribe to.
      #
      #   @return [Sentdm::Models::WebhookListEventTypesResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookListEventTypesResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::WebhookListEventTypesResponse::Error, nil]
      optional :error, -> { Sentdm::Models::WebhookListEventTypesResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::WebhookListEventTypesResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::WebhookListEventTypesResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::WebhookListEventTypesResponse::Data, nil] The webhook event types a customer can subscribe to.
      #
      #   @param error [Sentdm::Models::WebhookListEventTypesResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::WebhookListEventTypesResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::WebhookListEventTypesResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute event_types
        #   The event_types on this page.
        #
        #   @return [Array<Sentdm::Models::WebhookListEventTypesResponse::Data::EventType>, nil]
        optional :event_types,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::WebhookListEventTypesResponse::Data::EventType] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination, nil]
        optional :pagination, -> { Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination }

        # @!method initialize(event_types: nil, pagination: nil)
        #   The webhook event types a customer can subscribe to.
        #
        #   @param event_types [Array<Sentdm::Models::WebhookListEventTypesResponse::Data::EventType>] The event_types on this page.
        #
        #   @param pagination [Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination] Pagination metadata for list responses

        class EventType < Sentdm::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute display_name
          #
          #   @return [String, nil]
          optional :display_name, String

          # @!attribute event_type
          #
          #   @return [String, nil]
          optional :event_type, String, nil?: true

          # @!attribute is_active
          #
          #   @return [Boolean, nil]
          optional :is_active, Sentdm::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute sub_types
          #
          #   @return [Array<Object>, nil]
          optional :sub_types, Sentdm::Internal::Type::ArrayOf[Sentdm::Internal::Type::Unknown], nil?: true

          # @!method initialize(description: nil, display_name: nil, event_type: nil, is_active: nil, name: nil, sub_types: nil)
          #   @param description [String, nil]
          #   @param display_name [String]
          #   @param event_type [String, nil]
          #   @param is_active [Boolean]
          #   @param name [String]
          #   @param sub_types [Array<Object>, nil]
        end

        # @see Sentdm::Models::WebhookListEventTypesResponse::Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute cursors
          #   @deprecated
          #
          #   Cursor-based pagination. Never populated — see Cursors.
          #
          #   @return [Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors, nil]
          optional :cursors,
                   -> { Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors },
                   nil?: true

          # @!attribute has_more
          #   Whether there are more pages after this one
          #
          #   @return [Boolean, nil]
          optional :has_more, Sentdm::Internal::Type::Boolean

          # @!attribute page
          #   Current page number (1-indexed)
          #
          #   @return [Integer, nil]
          optional :page, Integer

          # @!attribute page_size
          #   Number of items per page
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute total_count
          #   Total number of items across all pages
          #
          #   @return [Integer, nil]
          optional :total_count, Integer

          # @!attribute total_pages
          #   Total number of pages
          #
          #   @return [Integer, nil]
          optional :total_pages, Integer

          # @!method initialize(cursors: nil, has_more: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
          #   Pagination metadata for list responses
          #
          #   @param cursors [Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination::Cursors, nil] Cursor-based pagination. Never populated — see Cursors.
          #
          #   @param has_more [Boolean] Whether there are more pages after this one
          #
          #   @param page [Integer] Current page number (1-indexed)
          #
          #   @param page_size [Integer] Number of items per page
          #
          #   @param total_count [Integer] Total number of items across all pages
          #
          #   @param total_pages [Integer] Total number of pages

          # @deprecated
          #
          # @see Sentdm::Models::WebhookListEventTypesResponse::Data::Pagination#cursors
          class Cursors < Sentdm::Internal::Type::BaseModel
            # @!attribute after
            #   Cursor to fetch the next page.
            #
            #   @return [String, nil]
            optional :after, String, nil?: true

            # @!attribute before
            #   Cursor to fetch the previous page.
            #
            #   @return [String, nil]
            optional :before, String, nil?: true

            # @!method initialize(after: nil, before: nil)
            #   Cursor-based pagination. Never populated — see Cursors.
            #
            #   @param after [String, nil] Cursor to fetch the next page.
            #
            #   @param before [String, nil] Cursor to fetch the previous page.
          end
        end
      end

      # @see Sentdm::Models::WebhookListEventTypesResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::WebhookListEventTypesResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
