# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#list_event_types
    class WebhookListEventTypesResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::WebhookListEventTypesResponse::Data, nil]
      optional :data, -> { SentDm::Models::WebhookListEventTypesResponse::Data }, nil?: true

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
      #   @param data [SentDm::Models::WebhookListEventTypesResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::WebhookListEventTypesResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute event_types
        #
        #   @return [Array<SentDm::Models::WebhookListEventTypesResponse::Data::EventType>, nil]
        optional :event_types,
                 -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::WebhookListEventTypesResponse::Data::EventType] }

        # @!method initialize(event_types: nil)
        #   The response data (null if error)
        #
        #   @param event_types [Array<SentDm::Models::WebhookListEventTypesResponse::Data::EventType>]

        class EventType < SentDm::Internal::Type::BaseModel
          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute display_name
          #
          #   @return [String, nil]
          optional :display_name, String

          # @!attribute is_active
          #
          #   @return [Boolean, nil]
          optional :is_active, SentDm::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(description: nil, display_name: nil, is_active: nil, name: nil)
          #   @param description [String, nil]
          #   @param display_name [String]
          #   @param is_active [Boolean]
          #   @param name [String]
        end
      end
    end
  end
end
