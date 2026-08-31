# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#retrieve_activities
    class MessageRetrieveActivitiesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response for GET /messages/{id}/activities
      #
      #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Error, nil]
      optional :error, -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MessageRetrieveActivitiesResponse::Data, nil] Response for GET /messages/{id}/activities
      #
      #   @param error [Sentdm::Models::MessageRetrieveActivitiesResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::MessageRetrieveActivitiesResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::MessageRetrieveActivitiesResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute activities
        #   List of activity events ordered by most recent first
        #
        #   @return [Array<Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity>, nil]
        optional :activities,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity] }

        # @!attribute message_id
        #   The message ID these activities belong to
        #
        #   @return [String, nil]
        optional :message_id, String

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination, nil]
        optional :pagination, -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination }

        # @!method initialize(activities: nil, message_id: nil, pagination: nil)
        #   Response for GET /messages/{id}/activities
        #
        #   @param activities [Array<Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity>] List of activity events ordered by most recent first
        #
        #   @param message_id [String] The message ID these activities belong to
        #
        #   @param pagination [Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination] Pagination metadata for list responses

        class Activity < Sentdm::Internal::Type::BaseModel
          # @!attribute active_contact_price
          #   Active contact markup applied on top of the channel cost, formatted to 4 decimal
          #   places.
          #
          #   @return [String, nil]
          optional :active_contact_price, String, nil?: true

          # @!attribute description
          #   Human-readable description of the activity
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute from
          #   Sender phone number for this activity (the customer's sending number for
          #   outbound, the external sender for inbound). Null when not reported by the
          #   provider.
          #
          #   @return [String, nil]
          optional :from, String, nil?: true

          # @!attribute price
          #   Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
          #   4 decimal places.
          #
          #   @return [String, nil]
          optional :price, String, nil?: true

          # @!attribute status
          #   Activity status. Outbound: QUEUED, PROCESSED, ROUTED, SENT, DELIVERED, READ,
          #   FAILED. Inbound (from contact): RECEIVED (terminal).
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute timestamp
          #   When this activity occurred
          #
          #   @return [Time, nil]
          optional :timestamp, Time

          # @!method initialize(active_contact_price: nil, description: nil, from: nil, price: nil, status: nil, timestamp: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Activity} for more
          #   details.
          #
          #   A single message activity event for v3 API
          #
          #   @param active_contact_price [String, nil] Active contact markup applied on top of the channel cost, formatted to 4 decimal
          #
          #   @param description [String] Human-readable description of the activity
          #
          #   @param from [String, nil] Sender phone number for this activity (the customer's sending number for outboun
          #
          #   @param price [String, nil] Channel cost for this activity (e.g., SMS/WhatsApp provider cost), formatted to
          #
          #   @param status [String] Activity status. Outbound: QUEUED, PROCESSED, ROUTED, SENT, DELIVERED, READ, FAI
          #
          #   @param timestamp [Time] When this activity occurred
        end

        # @see Sentdm::Models::MessageRetrieveActivitiesResponse::Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute cursors
          #   @deprecated
          #
          #   Cursor-based pagination. Never populated — see Cursors.
          #
          #   @return [Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination::Cursors, nil]
          optional :cursors,
                   -> { Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination::Cursors },
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
          #   @param cursors [Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination::Cursors, nil] Cursor-based pagination. Never populated — see Cursors.
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
          # @see Sentdm::Models::MessageRetrieveActivitiesResponse::Data::Pagination#cursors
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

      # @see Sentdm::Models::MessageRetrieveActivitiesResponse#error
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

      # @see Sentdm::Models::MessageRetrieveActivitiesResponse#meta
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
