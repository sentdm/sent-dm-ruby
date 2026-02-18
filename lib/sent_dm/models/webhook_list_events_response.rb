# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#list_events
    class WebhookListEventsResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::WebhookListEventsResponse::Data, nil]
      optional :data, -> { SentDm::Models::WebhookListEventsResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [SentDm::Models::APIError, nil]
      optional :error, -> { SentDm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [SentDm::Models::APIMeta, nil]
      optional :meta, -> { SentDm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, SentDm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [SentDm::Models::WebhookListEventsResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::WebhookListEventsResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute events
        #
        #   @return [Array<SentDm::Models::WebhookListEventsResponse::Data::Event>, nil]
        optional :events,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::WebhookListEventsResponse::Data::Event] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [SentDm::Models::PaginationMeta, nil]
        optional :pagination, -> { SentDm::PaginationMeta }

        # @!method initialize(events: nil, pagination: nil)
        #   The response data (null if error)
        #
        #   @param events [Array<SentDm::Models::WebhookListEventsResponse::Data::Event>]
        #
        #   @param pagination [SentDm::Models::PaginationMeta] Pagination metadata for list responses

        class Event < SentDm::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute created_at
          #
          #   @return [Time, nil]
          optional :created_at, Time

          # @!attribute delivery_attempts
          #
          #   @return [Integer, nil]
          optional :delivery_attempts, Integer

          # @!attribute delivery_status
          #
          #   @return [String, nil]
          optional :delivery_status, String

          # @!attribute error_message
          #
          #   @return [String, nil]
          optional :error_message, String, nil?: true

          # @!attribute event_data
          #
          #   @return [Object, nil]
          optional :event_data, SentDm::Internal::Type::Unknown

          # @!attribute event_type
          #
          #   @return [String, nil]
          optional :event_type, String

          # @!attribute http_status_code
          #
          #   @return [Integer, nil]
          optional :http_status_code, Integer, nil?: true

          # @!attribute processing_completed_at
          #
          #   @return [Time, nil]
          optional :processing_completed_at, Time, nil?: true

          # @!attribute processing_started_at
          #
          #   @return [Time, nil]
          optional :processing_started_at, Time, nil?: true

          # @!attribute response_body
          #
          #   @return [String, nil]
          optional :response_body, String, nil?: true

          # @!method initialize(id: nil, created_at: nil, delivery_attempts: nil, delivery_status: nil, error_message: nil, event_data: nil, event_type: nil, http_status_code: nil, processing_completed_at: nil, processing_started_at: nil, response_body: nil)
          #   @param id [String]
          #   @param created_at [Time]
          #   @param delivery_attempts [Integer]
          #   @param delivery_status [String]
          #   @param error_message [String, nil]
          #   @param event_data [Object]
          #   @param event_type [String]
          #   @param http_status_code [Integer, nil]
          #   @param processing_completed_at [Time, nil]
          #   @param processing_started_at [Time, nil]
          #   @param response_body [String, nil]
        end
      end
    end
  end
end
