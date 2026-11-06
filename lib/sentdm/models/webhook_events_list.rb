# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookEventsList < Sentdm::Internal::Type::BaseModel
      # @!attribute events
      #   The events on this page.
      #
      #   @return [Array<Sentdm::Models::WebhookDelivery>, nil]
      optional :events, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::WebhookDelivery] }

      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!method initialize(events: nil, pagination: nil)
      #   A paginated list of webhook delivery records.
      #
      #   @param events [Array<Sentdm::Models::WebhookDelivery>] The events on this page.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
    end
  end
end
