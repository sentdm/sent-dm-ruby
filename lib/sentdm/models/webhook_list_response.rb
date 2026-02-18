# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list
    class WebhookListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::WebhookListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookListResponse::Data }, nil?: true

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
      #   @param data [Sentdm::Models::WebhookListResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [Sentdm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::WebhookListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!attribute webhooks
        #
        #   @return [Array<Sentdm::Models::WebhookResponse>, nil]
        optional :webhooks, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::WebhookResponse] }

        # @!method initialize(pagination: nil, webhooks: nil)
        #   The response data (null if error)
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
        #
        #   @param webhooks [Array<Sentdm::Models::WebhookResponse>]
      end
    end
  end
end
