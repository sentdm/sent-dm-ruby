# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_events
    class WebhookListEventsResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::WebhookListEventsResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookListEventsResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::WebhookListEventsResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [Sentdm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::WebhookListEventsResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute events
        #
        #   @return [Array<Sentdm::Models::WebhookListEventsResponse::Data::Event>, nil]
        optional :events,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::WebhookListEventsResponse::Data::Event] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(events: nil, pagination: nil)
        #   The response data (null if error)
        #
        #   @param events [Array<Sentdm::Models::WebhookListEventsResponse::Data::Event>]
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses

        class Event < Sentdm::Internal::Type::BaseModel
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
          optional :event_data, Sentdm::Internal::Type::Unknown

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
