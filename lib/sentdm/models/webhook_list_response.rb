# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list
    class WebhookListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   A paginated list of webhooks.
      #
      #   @return [Sentdm::Models::WebhookListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookListResponse::Data }, nil?: true

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
      #   @param data [Sentdm::Models::WebhookListResponse::Data, nil] A paginated list of webhooks.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
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
        #   The webhooks on this page.
        #
        #   @return [Array<Sentdm::Models::WebhookResponse>, nil]
        optional :webhooks, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::WebhookResponse] }

        # @!method initialize(pagination: nil, webhooks: nil)
        #   A paginated list of webhooks.
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
        #
        #   @param webhooks [Array<Sentdm::Models::WebhookResponse>] The webhooks on this page.
      end
    end
  end
end
