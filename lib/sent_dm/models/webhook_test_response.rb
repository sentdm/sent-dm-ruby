# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#test_
    class WebhookTestResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::WebhookTestResponse::Data, nil]
      optional :data, -> { SentDm::Models::WebhookTestResponse::Data }, nil?: true

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
      #   @param data [SentDm::Models::WebhookTestResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::WebhookTestResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute success
        #
        #   @return [Boolean, nil]
        optional :success, SentDm::Internal::Type::Boolean

        # @!method initialize(message: nil, success: nil)
        #   The response data (null if error)
        #
        #   @param message [String]
        #   @param success [Boolean]
      end
    end
  end
end
