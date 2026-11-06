# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookEventTypesList < Sentdm::Internal::Type::BaseModel
      # @!attribute event_types
      #   The event_types on this page.
      #
      #   @return [Array<Sentdm::Models::WebhookEventType>, nil]
      optional :event_types, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::WebhookEventType] }

      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!method initialize(event_types: nil, pagination: nil)
      #   The webhook event types a customer can subscribe to.
      #
      #   @param event_types [Array<Sentdm::Models::WebhookEventType>] The event_types on this page.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
    end
  end
end
