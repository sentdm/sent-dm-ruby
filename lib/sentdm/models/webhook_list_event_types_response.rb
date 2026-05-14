# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_event_types
    class WebhookListEventTypesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::WebhookListEventTypesResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookListEventTypesResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
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
      #   @param data [Sentdm::Models::WebhookListEventTypesResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::WebhookListEventTypesResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute event_types
        #
        #   @return [Array<Sentdm::Models::WebhookEventType>, nil]
        optional :event_types, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::WebhookEventType] }

        # @!method initialize(event_types: nil)
        #   The response data (null if error)
        #
        #   @param event_types [Array<Sentdm::Models::WebhookEventType>]
      end
    end
  end
end
