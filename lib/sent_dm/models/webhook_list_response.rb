# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#list
    class WebhookListResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::WebhookListResponse::Data, nil]
      optional :data, -> { SentDm::Models::WebhookListResponse::Data }, nil?: true

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
      #   @param data [SentDm::Models::WebhookListResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::WebhookListResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [SentDm::Models::PaginationMeta, nil]
        optional :pagination, -> { SentDm::PaginationMeta }

        # @!attribute webhooks
        #
        #   @return [Array<SentDm::Models::WebhookResponse>, nil]
        optional :webhooks, -> { SentDm::Internal::Type::ArrayOf[SentDm::WebhookResponse] }

        # @!method initialize(pagination: nil, webhooks: nil)
        #   The response data (null if error)
        #
        #   @param pagination [SentDm::Models::PaginationMeta] Pagination metadata for list responses
        #
        #   @param webhooks [Array<SentDm::Models::WebhookResponse>]
      end
    end
  end
end
