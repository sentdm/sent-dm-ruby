# frozen_string_literal: true

module Sentdm
  module Models
    class WebhooksList < Sentdm::Internal::Type::BaseModel
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
